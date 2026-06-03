//
//  ProductDetailViewController.swift
//  UniAppXDemo
//
//  Created by Codex on 2026/5/29.
//

import UIKit
import SDWebImage

final class ProductDetailViewController: UIViewController, UIGestureRecognizerDelegate {

    private static let uniAppXMessageNotification = Notification.Name("UniAppXNativeMessage")
    private enum UniAppXMessageMethod {
        static let productNameTap = "productNameTap"
    }

    private let product: [String: Any]
    private let nativeNavigationBar = NativeNavigationBar()
    private weak var previousPopGestureDelegate: UIGestureRecognizerDelegate?
    private var previousNavigationBarHidden: Bool?
    private var disabledNavigationGestureStates: [(gesture: UIGestureRecognizer, isEnabled: Bool)] = []

    init(product: [String: Any]) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = textValue("name", defaultValue: "商品详情")
        configureNavigation()
        buildView()
    }



    private func configureNavigation() {
        nativeNavigationBar.updateTitle(textValue("name", defaultValue: "商品详情"))
        nativeNavigationBar.backgroundColor = UIColor.red
        nativeNavigationBar.onBack = { [weak self] in
            self?.closePage()
        }
    }

    private func buildView() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        let iconView = UILabel()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.text = textValue("icon", defaultValue: "商品")
        iconView.textAlignment = .center
        iconView.textColor = .white
        iconView.font = .systemFont(ofSize: 24, weight: .bold)
        iconView.backgroundColor = colorValue("color")
        iconView.layer.cornerRadius = 18
        iconView.layer.masksToBounds = true

        let nameLabel = label(
            text: textValue("name", defaultValue: "未命名商品"),
            font: .systemFont(ofSize: 28, weight: .bold),
            color: .black,
            lines: 0
        )
        nameLabel.isUserInteractionEnabled = true
        nameLabel.accessibilityTraits.insert(.button)
        nameLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleNameLabelTap)))

        let tagLabel = pillLabel(textValue("tag", defaultValue: "精选商品"))

        let priceLabel = label(
            text: "¥\(textValue("price", defaultValue: "0"))",
            font: .systemFont(ofSize: 30, weight: .bold),
            color: .systemRed,
            lines: 1
        )

        let soldLabel = label(
            text: "已售 \(textValue("sold", defaultValue: "0")) 件",
            font: .systemFont(ofSize: 15, weight: .medium),
            color: .darkGray,
            lines: 1
        )

        let descTitleLabel = label(
            text: "商品介绍",
            font: .systemFont(ofSize: 18, weight: .semibold),
            color: .black,
            lines: 1
        )

        let descLabel = label(
            text: textValue("desc", defaultValue: "暂无商品介绍"),
            font: .systemFont(ofSize: 16, weight: .regular),
            color: .darkGray,
            lines: 0
        )

        let idLabel = label(
            text: "商品ID：\(textValue("id", defaultValue: "-"))",
            font: .systemFont(ofSize: 14, weight: .regular),
            color: .gray,
            lines: 1
        )

        let headerStack = UIStackView(arrangedSubviews: [nameLabel, tagLabel])
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        headerStack.axis = .vertical
        headerStack.alignment = .leading
        headerStack.spacing = 10

        let priceStack = UIStackView(arrangedSubviews: [priceLabel, soldLabel])
        priceStack.translatesAutoresizingMaskIntoConstraints = false
        priceStack.axis = .vertical
        priceStack.alignment = .leading
        priceStack.spacing = 6

        let descStack = UIStackView(arrangedSubviews: [descTitleLabel, descLabel, idLabel])
        descStack.translatesAutoresizingMaskIntoConstraints = false
        descStack.axis = .vertical
        descStack.alignment = .fill
        descStack.spacing = 12

        view.addSubview(scrollView)
        view.addSubview(nativeNavigationBar)
        scrollView.addSubview(contentView)
        contentView.addSubview(iconView)
        contentView.addSubview(headerStack)
        contentView.addSubview(priceStack)
        contentView.addSubview(descStack)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: nativeNavigationBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            nativeNavigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            nativeNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nativeNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nativeNavigationBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 72),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            iconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.52),

            headerStack.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 28),
            headerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            priceStack.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 22),
            priceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            priceStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            descStack.topAnchor.constraint(equalTo: priceStack.bottomAnchor, constant: 34),
            descStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }


    private func label(text: String, font: UIFont, color: UIColor, lines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.numberOfLines = lines
        return label
    }

    private func pillLabel(_ text: String) -> UILabel {
        let label = PaddingLabel(top: 6, left: 12, bottom: 6, right: 12)
        label.text = text
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }

    private func textValue(_ key: String, defaultValue: String = "") -> String {
        guard let value = product[key] else {
            return defaultValue
        }

        if let string = value as? String {
            return string.isEmpty ? defaultValue : string
        }

        return "\(value)"
    }

    private func colorValue(_ key: String) -> UIColor {
        let hex = textValue(key, defaultValue: "#3B82F6")
        return UIColor(hexString: hex) ?? .systemBlue
    }

    @objc private func closePage() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    @objc private func handleNameLabelTap() {
        NotificationCenter.default.post(
            name: Self.uniAppXMessageNotification,
            object: nil,
            userInfo: [
                "methodName": UniAppXMessageMethod.productNameTap,
                "data": productJSONText()
            ]
        )
    }

    private func productJSONText() -> String {
        guard JSONSerialization.isValidJSONObject(product),
              let data = try? JSONSerialization.data(withJSONObject: product),
              let jsonText = String(data: data, encoding: .utf8) else {
            return textValue("name", defaultValue: "")
        }

        return jsonText
    }

}

private final class PaddingLabel: UILabel {

    private let insets: UIEdgeInsets

    init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + insets.left + insets.right, height: size.height + insets.top + insets.bottom)
    }
}

private extension UIColor {

    convenience init?(hexString: String) {
        var cleaned = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleaned.hasPrefix("#") {
            cleaned.removeFirst()
        }

        guard cleaned.count == 6, let hexValue = Int(cleaned, radix: 16) else {
            return nil
        }

        let red = CGFloat((hexValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((hexValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hexValue & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
