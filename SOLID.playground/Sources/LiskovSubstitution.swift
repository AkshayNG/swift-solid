import Foundation

//Every subclass or derived class should be substitutable for their base or parent class.

public class VolumeSumCalculator: AreaSumCalculator {
    
    override public func sum() -> Double {
        let volumes = shapes.map { $0.volume() }
        let total = volumes.reduce(0, +)
        return total
    }
    
}
