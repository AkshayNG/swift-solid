import Foundation
import Darwin

//Shape 1
public class Square {
    var length: Double!
    
    public init(length: Double) {
        self.length = length
    }
}

//Shape 2
public class Circle {
    var radius: Double!
    
    public init(radius: Double) {
        self.radius = radius
    }
}

//3
public class AreaSumCalculator {
    
    var shapes: [Any] = []
    
    public init(shapes:[Any]) {
        self.shapes = shapes
    }
    
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
    
    //Putting this output() will violets single responsibilty principle, as the responsibilty of this class is to calculate and return sum of the areas of the shapes, it doesn't have to do anything with output - whether to convert it into json or simple print.
    public func output() {
        let total = sum()
        print("Sum of the areas of provided shapes: \(total)")
    }
    
}
