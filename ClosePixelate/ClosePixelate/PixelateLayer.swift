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
    public var resolution: CGFloat = 16
    public var size: CGFloat?
    public var alpha: CGFloat = 1
    public var offset: CGFloat = 0
    public let shape: Shape
    
    typealias BuilderClosure = (PixelateLayer) -> Void
    
    public init(_ shape: Shape, build: BuilderClosure) {
        self.shape = shape
        build(self)
    }
    
    public enum Shape {
        case circle
        case diamond
        case square
    }
}
