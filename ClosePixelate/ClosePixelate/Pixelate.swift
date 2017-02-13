//
//  Close Pixelate for iOS
//  based on http://desandro.com/resources/close-pixelate/
//
//  Developed by
//  - David DeSandro  http://desandro.com
//  - John Schulz  http://twitter.com/jfsiii
//
//  Swift port by
//  - Boris Maslakov
//
//  Licensed under MIT license
//

import Foundation

public class Pixelate {
    private static let SQRT2 = CGFloat(sqrt(2))
    
    public static func create(pixels: CGImage, inBounds: CGRect? = nil, outBounds: CGRect? = nil, layers: PixelateLayer...) -> CGImage? {
        return create(pixels: pixels, inBounds: inBounds, width: pixels.width, height: pixels.height, outBounds: outBounds, layers: layers)
    }
    
    public static func create(pixels: CGImage, inBounds: CGRect? = nil, outBounds: CGRect? = nil, layers: [PixelateLayer]) -> CGImage? {
        return create(pixels: pixels, inBounds: inBounds, width: pixels.width, height: pixels.height, outBounds: outBounds, layers: layers)
    }
    
    public static func create(pixels: CGImage, inBounds: CGRect? = nil, width: Int, height: Int, outBounds: CGRect? = nil, layers: PixelateLayer...) -> CGImage? {
        return create(pixels: pixels, inBounds: inBounds, width: width, height: height, outBounds: outBounds, layers: layers)
    }
    
    public static func create(pixels: CGImage, inBounds: CGRect? = nil, width: Int, height: Int, outBounds: CGRect? = nil, layers: [PixelateLayer]) -> CGImage? {
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let outBounds = outBounds ?? CGRect(x: 0, y: 0, width: width, height: height)
        
        if let canvas = CGContext(data: nil,
                                  width: width,
                                  height: height,
                                  bitsPerComponent: 8,
                                  bytesPerRow: 0,
                                  space: rgbColorSpace,
                                  bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue) {
            
            canvas.translateBy(x: 0, y: outBounds.height) // to flip the image vertically
            canvas.scaleBy(x: 1, y: -1) // to flip the image vertically
            render(pixels: pixels, inBounds: inBounds, canvas: canvas, outBounds: outBounds, layers: layers)
            
            return canvas.makeImage()
        } else {
            return nil
        }
    }
    
    public static func render(pixels: CGImage, inBounds: CGRect? = nil, canvas: CGContext, outBounds: CGRect, layers: PixelateLayer...) {
        render(pixels: pixels, inBounds: inBounds, canvas: canvas, outBounds: outBounds, layers: layers)
    }
    
    public static func render(pixels: CGImage, inBounds: CGRect? = nil, canvas: CGContext, outBounds: CGRect, layers: [PixelateLayer]) {
        let inWidth = inBounds?.width ?? CGFloat(pixels.width)
        let inHeight = inBounds?.height ?? CGFloat(pixels.height)
        let inX = inBounds?.minX ?? 0
        let inY = inBounds?.minY ?? 0
        let scaleX = outBounds.width / inWidth
        let scaleY = outBounds.height / inHeight
        
        canvas.saveGState()
        canvas.clip(to: outBounds)
        canvas.translateBy(x: outBounds.minX, y: outBounds.minY)
        canvas.scaleBy(x: scaleX, y: scaleY)
        
        let pixelData = pixels.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        for layer in layers {
            // option defaults
            let size = layer.size ?? layer.resolution
            let cols = Int(inWidth / layer.resolution + 1)
            let rows = Int(inHeight / layer.resolution + 1)
            let halfSize = size / 2
            let diamondSize = size / SQRT2
            let halfDiamondSize = diamondSize / 2
            
            for row in 0...rows {
                let y = (CGFloat(row) - 0.5) * layer.resolution + layer.offset
                // normalize y so shapes around edges get color
                let pixelY = inY + max(min(y, inHeight - 1), 0)
                
                for col in 0...cols {
                    let x = (CGFloat(col) - 0.5) * layer.resolution + layer.offset;
                    // normalize y so shapes around edges get color
                    let pixelX = inX + max(min(x, inWidth - 1), 0)
                    
                    // set pixel color
                    
                    let color = UIColor.at(image: pixels, data: data, x: Int(pixelX), y: Int(pixelY))
                    canvas.setFillColor(color.multiply(alpha: layer.alpha).cgColor)
                
                    switch (layer.shape) {
                    case .circle:
                        canvas.addArc(center: CGPoint(x: x, y: y),
                                      radius: halfSize,
                                      startAngle: 0,
                                      endAngle: 2 * CGFloat.pi,
                                      clockwise: false)
                    case .diamond:
                        canvas.saveGState()
                        canvas.translateBy(x: x, y: y)
                        canvas.rotate(by: CGFloat.pi / 4)
                        canvas.addRect(CGRect(x: -halfDiamondSize,
                                              y: -halfDiamondSize,
                                              width: 2 * halfDiamondSize,
                                              height: 2 * halfDiamondSize))
                        canvas.restoreGState()
                    case .square:
                        canvas.addRect(CGRect(x: x - halfSize,
                                              y: y - halfSize,
                                              width: 2 * halfSize,
                                              height: 2 * halfSize))
                    } // switch
                    canvas.fillPath()
                } // col
            } // row
        }
        canvas.restoreGState()
    }
}

fileprivate extension UIColor {
    public func multiply(alpha: CGFloat) -> UIColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: r, green: g, blue: b, alpha: a * alpha)
    }
    
    public static func at(image: CGImage, x: Int, y: Int) -> UIColor? {
        if let pixelData = image.dataProvider?.data {
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            return UIColor.at(image: image, data: data, x: x, y: y)
        } else {
            return nil
        }
    }
    
    /// reuse array
    public static func at(image: CGImage, data: UnsafePointer<UInt8>, x: Int, y: Int) -> UIColor {
        let index = image.bytesPerRow * Int(y) + Int(x) * image.bitsPerPixel / 8
        let color: UIColor
        switch image.alphaInfo {
        case .alphaOnly:
            color = UIColor(red: 0,
                            green: 0,
                            blue: 0,
                            alpha: CGFloat(data[index]) / 255.0)
        case .none:
            color = UIColor(red: CGFloat(data[index]) / 255.0,
                            green: CGFloat(data[index + 1]) / 255.0,
                            blue: CGFloat(data[index + 2]) / 255.0,
                            alpha: 1.0)
        case .noneSkipLast:
            color = UIColor(red: CGFloat(data[index]) / 255.0,
                            green: CGFloat(data[index + 1]) / 255.0,
                            blue: CGFloat(data[index + 2]) / 255.0,
                            alpha: 1.0)
        case .noneSkipFirst:
            color = UIColor(red: CGFloat(data[index + 1]) / 255.0,
                            green: CGFloat(data[index + 2]) / 255.0,
                            blue: CGFloat(data[index + 3]) / 255.0,
                            alpha: 1.0)
        case .first:
            color = UIColor(red: CGFloat(data[index + 1]) / 255.0,
                            green: CGFloat(data[index + 2]) / 255.0,
                            blue: CGFloat(data[index + 3]) / 255.0,
                            alpha: CGFloat(data[index]) / 255.0)
        case .last:
            color = UIColor(red: CGFloat(data[index]) / 255.0,
                            green: CGFloat(data[index + 1]) / 255.0,
                            blue: CGFloat(data[index + 2]) / 255.0,
                            alpha: CGFloat(data[index + 3]) / 255.0)
        default:
            // unsupported format
            color = UIColor.clear
        }
        return color
    }
}
