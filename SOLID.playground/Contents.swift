import UIKit


let sq1 = Square.init(length: 5)
let sq2 = Square.init(length: 9)
let c1 = Circle.init(radius: 7)

/* Single Responsibility */
let calculator1 = ShapeSumCalculator.init(shapes: [sq1, sq2, c1])
let outputter1 = ShapeSumCalculatorOutputter.init(calculator: calculator1)
outputter1.toJSON()
outputter1.printOutput()


/* Open-Closed */
let calculator2 = AreaSumCalculator.init(shapes: [sq1, sq2, c1])
let outputter2 = AreaSumCalculatorOutputter.init(calculator: calculator2)
outputter2.toJSON()
outputter2.printOutput()


/* Liskov Substitution */
let calculator3 = VolumeSumCalculator.init(shapes: [sq1, sq2, c1])
let outputter3 = AreaSumCalculatorOutputter.init(calculator: calculator3)
outputter3.toJSON()
outputter3.printOutput()
