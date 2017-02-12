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

public class PixelateLayer {
    public let shape: Shape
    public var resolution: CGFloat
    public var size: CGFloat?
    public var alpha: CGFloat
    public var offset: CGFloat
    
    public init(_ shape: Shape, resolution: CGFloat, size: CGFloat? = nil, offset: CGFloat = 0, alpha: CGFloat = 1) {
        self.shape = shape
        self.resolution = resolution
        self.size = size
        self.offset = offset
        self.alpha = alpha
    }
    
    public enum Shape {
        case circle
        case diamond
        case square
    }
}
