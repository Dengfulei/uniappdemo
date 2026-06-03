//
//  NativeNavigationBar.swift
//  UniAppXDemo
//
//  Created by Codex on 2026/6/1.
//

import UIKit

final class NativeNavigationBar: UIView {

    var onBack: (() -> Void)?

    private let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    private let contentView = UIView()
    private let backButton = UIButton(type: .system)
    private let titleLabel = UILabel()
    private var topConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateTitle(_ title: String) {
        titleLabel.text = title
    }

    private func buildView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(backgroundView)
        addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)

        backButton.setTitle("返回", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        backButton.contentHorizontalAlignment = .left
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)

        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.lineBreakMode = .byTruncatingTail

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 44),

            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 52),
            backButton.heightAnchor.constraint(equalToConstant: 44),

            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -68)
        ])
    }

    @objc private func handleBack() {
        onBack?()
    }
}
