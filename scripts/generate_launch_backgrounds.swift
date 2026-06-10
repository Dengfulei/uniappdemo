import AppKit
import CoreGraphics
import Foundation

struct LaunchBackground {
    let filename: String
    let width: Int
    let height: Int
}

let outputDir = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)

let backgrounds = [
    LaunchBackground(filename: "dc_launchscreen_portrait_background@2x.png", width: 750, height: 1624),
    LaunchBackground(filename: "dc_launchscreen_portrait_background@3x.png", width: 1125, height: 2436),
    LaunchBackground(filename: "dc_launchscreen_landscape_background@2x.png", width: 1624, height: 750),
    LaunchBackground(filename: "dc_launchscreen_landscape_background@3x.png", width: 2436, height: 1125),
    LaunchBackground(filename: "dc_launchscreen_pad_background@2x.png", width: 1536, height: 2048),
    LaunchBackground(filename: "dc_launchscreen_pad_background@3x.png", width: 2304, height: 3072),
]

func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> CGColor {
    CGColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
}

func drawBackground(_ item: LaunchBackground) throws {
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    guard let context = CGContext(
        data: nil,
        width: item.width,
        height: item.height,
        bitsPerComponent: 8,
        bytesPerRow: 0,
        space: colorSpace,
        bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
    ) else {
        throw NSError(domain: "LaunchBackground", code: 1)
    }

    let bounds = CGRect(x: 0, y: 0, width: item.width, height: item.height)
    let gradient = CGGradient(
        colorsSpace: colorSpace,
        colors: [color(236, 250, 240), color(209, 235, 220), color(245, 250, 247)] as CFArray,
        locations: [0.0, 0.62, 1.0]
    )!
    context.drawLinearGradient(
        gradient,
        start: CGPoint(x: bounds.midX, y: bounds.maxY),
        end: CGPoint(x: bounds.midX, y: bounds.minY),
        options: []
    )

    let shortest = CGFloat(min(item.width, item.height))
    context.setFillColor(color(75, 181, 93).copy(alpha: 0.16)!)
    context.fillEllipse(in: CGRect(
        x: CGFloat(item.width) * 0.58,
        y: CGFloat(item.height) * 0.07,
        width: shortest * 0.58,
        height: shortest * 0.58
    ))

    context.setFillColor(color(35, 134, 72).copy(alpha: 0.10)!)
    context.fillEllipse(in: CGRect(
        x: -shortest * 0.26,
        y: CGFloat(item.height) * 0.68,
        width: shortest * 0.54,
        height: shortest * 0.54
    ))

    context.setFillColor(color(255, 255, 255).copy(alpha: 0.55)!)
    let stripeHeight = max(8.0, shortest * 0.012)
    for index in 0..<7 {
        let y = CGFloat(item.height) * 0.17 + CGFloat(index) * stripeHeight * 3.1
        context.fill(CGRect(x: CGFloat(item.width) * 0.10, y: y, width: CGFloat(item.width) * 0.80, height: stripeHeight))
    }

    guard let image = context.makeImage() else {
        throw NSError(domain: "LaunchBackground", code: 2)
    }
    let bitmap = NSBitmapImageRep(cgImage: image)
    guard let data = bitmap.representation(using: .png, properties: [:]) else {
        throw NSError(domain: "LaunchBackground", code: 3)
    }
    try data.write(to: outputDir.appendingPathComponent(item.filename), options: .atomic)
}

try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)
for item in backgrounds {
    try drawBackground(item)
}
