import AppKit
import CoreGraphics
import Foundation

let root = URL(fileURLWithPath: CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : FileManager.default.currentDirectoryPath, isDirectory: true)
let outputDir = root.appendingPathComponent("static/tabbar", isDirectory: true)
let size = 81

struct Palette {
    let normal = CGColor(red: 139.0 / 255.0, green: 129.0 / 255.0, blue: 114.0 / 255.0, alpha: 1)
    let active = CGColor(red: 186.0 / 255.0, green: 83.0 / 255.0, blue: 54.0 / 255.0, alpha: 1)
}

enum IconKind {
    case home
    case cart
    case mine
}

func drawIcon(kind: IconKind, color: CGColor, active: Bool, to url: URL) throws {
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    guard let context = CGContext(
        data: nil,
        width: size,
        height: size,
        bitsPerComponent: 8,
        bytesPerRow: 0,
        space: colorSpace,
        bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
    ) else {
        throw NSError(domain: "TabbarIcon", code: 1)
    }

    context.clear(CGRect(x: 0, y: 0, width: size, height: size))
    context.translateBy(x: 0, y: CGFloat(size))
    context.scaleBy(x: 1, y: -1)
    context.setStrokeColor(color)
    context.setFillColor(color)
    context.setLineWidth(active ? 5.4 : 4.8)
    context.setLineCap(.round)
    context.setLineJoin(.round)

    switch kind {
    case .home:
        context.move(to: CGPoint(x: 20, y: 41))
        context.addLine(to: CGPoint(x: 40.5, y: 23))
        context.addLine(to: CGPoint(x: 61, y: 41))
        context.strokePath()

        let body = CGRect(x: 24, y: 39, width: 33, height: 23)
        context.stroke(body, width: active ? 5.4 : 4.8)
        context.move(to: CGPoint(x: 40.5, y: 62))
        context.addLine(to: CGPoint(x: 40.5, y: 50))
        context.strokePath()
    case .cart:
        context.move(to: CGPoint(x: 18, y: 26))
        context.addLine(to: CGPoint(x: 25, y: 26))
        context.addLine(to: CGPoint(x: 31, y: 53))
        context.addLine(to: CGPoint(x: 57, y: 53))
        context.addLine(to: CGPoint(x: 63, y: 33))
        context.addLine(to: CGPoint(x: 29, y: 33))
        context.strokePath()

        context.fillEllipse(in: CGRect(x: 31, y: 60, width: 7.5, height: 7.5))
        context.fillEllipse(in: CGRect(x: 53, y: 60, width: 7.5, height: 7.5))
    case .mine:
        context.strokeEllipse(in: CGRect(x: 30, y: 19, width: 21, height: 21))
        context.move(to: CGPoint(x: 20, y: 64))
        context.addCurve(to: CGPoint(x: 61, y: 64), control1: CGPoint(x: 24, y: 49), control2: CGPoint(x: 57, y: 49))
        context.strokePath()
    }

    if active {
        context.fillEllipse(in: CGRect(x: 36, y: 70, width: 9, height: 5))
    }

    guard let image = context.makeImage() else {
        throw NSError(domain: "TabbarIcon", code: 2)
    }
    let bitmap = NSBitmapImageRep(cgImage: image)
    guard let data = bitmap.representation(using: .png, properties: [:]) else {
        throw NSError(domain: "TabbarIcon", code: 3)
    }
    try data.write(to: url, options: .atomic)
}

try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)

let palette = Palette()
let icons: [(IconKind, String)] = [
    (.home, "home"),
    (.cart, "cart"),
    (.mine, "mine")
]

for (kind, name) in icons {
    try drawIcon(kind: kind, color: palette.normal, active: false, to: outputDir.appendingPathComponent("\(name).png"))
    try drawIcon(kind: kind, color: palette.active, active: true, to: outputDir.appendingPathComponent("\(name)-active.png"))
}
