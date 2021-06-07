import Foundation

//Open-Closed
//Objects or entities should be open for extension but closed for modification.
//A class should be extendable without modifying the class itself.

//Coding to an interface is an integral part of SOLID.
public protocol TwoDimensionalShape {
    func area() -> Double
    //func volume() -> Double
}

extension Square: TwoDimensionalShape {
    public func area() -> Double {
        return pow(length, 2)
    }
    
    /* Violation of interface segregation as Square don't have volume, still its forced to use it*/
//    public func volume() -> Double {
//        return 0
//    }
}

extension Circle: TwoDimensionalShape {
    public func area() -> Double {
        return Double.pi * (pow(radius, 2))
    }
    
    /* Violation of interface segregation as Circle don't have volume, still its forced to use it*/
//    public func volume() -> Double {
//        return 0
//    }
}

public class AreaSumCalculator {
    var shapes: [TwoDimensionalShape] = []
    
    public init(shapes:[TwoDimensionalShape]) {
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


public class AreaCalculatorOutputter
{
    private var calculator: AreaSumCalculator!
    
    public init(calculator: AreaSumCalculator) {
        self.calculator = calculator
    }
    
    public func toJSON() -> [String: Any] {
        let total = self.calculator.sum()
        let json = [ "data" : total ]
        return json
    }
    
    public func printOutput() {
        let total = self.calculator.sum()
        print("Sum for provided shapes: \(total)")
    }
}



