import Foundation

//Coding to an interface is an integral part of SOLID.
public protocol Shape {
    func area() -> Double
}

extension Square: Shape {
    public func area() -> Double {
        return pow(length, 2)
    }
}

extension Circle: Shape {
    public func area() -> Double {
        return Double.pi * (pow(radius, 2))
    }
}

public class ShapeSumCalculator {
    var shapes: [Shape] = []
    
    public init(shapes:[Shape]) {
        self.shapes = shapes
    }
    
    /*
     Consider a scenario where the user would like the sum of additional shapes like triangles, pentagons, hexagons, etc. You would have to constantly edit this file and add more if/else blocks. That would violate the open-closed principle.
     
    public func sum() -> Double {
        var area:Double = 0
        shapes.forEach { (shape) in
            if let square = shape as? Square {
                area += pow(square.length, 2)
            }
            else if let circle = shape as? Circle {
                area += (Double.pi * pow(circle.radius, 2))
            }
        }
        return area
    }
    */
    
    public func sum() -> Double {
        let areas = shapes.map { $0.area() }
        let total = areas.reduce(0, +)
        return total
    }
}




