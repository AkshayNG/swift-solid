import Foundation

//Liskov Substitution
//Every subclass or derived class should be substitutable for their base or parent class.

public class AreaDiffCalculator: AreaSumCalculator {
    
    override public func sum() -> Double {
        let areas = shapes.map { $0.area() }
        let total = areas.reduce(0, -)
        return total
    }
    
}
