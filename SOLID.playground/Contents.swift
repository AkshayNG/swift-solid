import UIKit


let sq1 = Square.init(length: 5)
let sq2 = Square.init(length: 9)
let c1 = Circle.init(radius: 7)

/* Single Responsibility */
let calculator = AreaSumCalculator.init(shapes: [sq1, sq2, c1])
let total = calculator.sum()
calculator.output() //Violet single responsibilty principle


/* Open-Closed */
let calculator2 = ShapeSumCalculator.init(shapes: [sq1, sq2, c1])
let total2 = calculator.sum()
