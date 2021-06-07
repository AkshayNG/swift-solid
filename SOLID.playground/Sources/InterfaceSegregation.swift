import Foundation

//Interface Segregation
//A client should never be forced to implement an interface that it doesn’t use

public protocol ThreeDimensionalShape {
    func volume() -> Double
}

public class Cuboid: TwoDimensionalShape, ThreeDimensionalShape {
    
    var length: Double
    var width: Double
    var height: Double
    
    public init(length: Double, width: Double, height: Double) {
        self.length = length
        self.width = width
        self.height = height
    }
    
    public func area() -> Double {
        return 2 * ((length * width) + (length * height) + (width * height))
    }
    
    public func volume() -> Double {
        return length * width * height
    }
}

public class VolumeSumCalculator {
    
    var shapes: [ThreeDimensionalShape] = []
    
    public init(shapes:[ThreeDimensionalShape]) {
        self.shapes = shapes
    }
    
    public func sum() -> Double {
        let areas = shapes.map { $0.volume() }
        let total = areas.reduce(0, +)
        return total
    }
}
