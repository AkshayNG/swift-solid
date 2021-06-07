import UIKit


let sq1 = Square.init(length: 5)
let sq2 = Square.init(length: 9)
let c1 = Circle.init(radius: 7)

/* Single Responsibility */
let calculator1 = ShapeSumCalculator.init(shapes: [sq1, sq2, c1])
let outputter1 = ShapeCalculatorOutputter.init(calculator: calculator1)
outputter1.toJSON()
outputter1.printOutput()


/* Open-Closed */
let calculator2 = AreaSumCalculator.init(shapes: [sq1, sq2, c1])
let outputter2 = AreaCalculatorOutputter.init(calculator: calculator2)
outputter2.toJSON()
outputter2.printOutput()


/* Liskov Substitution */
let calculator3 = AreaDiffCalculator.init(shapes: [sq1, sq2, c1])
let outputter3 = AreaCalculatorOutputter.init(calculator: calculator3)
outputter3.toJSON()
outputter3.printOutput()


/* Interface Segregation */
let cuboid1 = Cuboid.init(length: 1, width: 2, height: 3)
let cuboid2 = Cuboid.init(length: 4, width: 5, height: 6)
let calculator4 = VolumeSumCalculator.init(shapes: [cuboid1, cuboid2])
let totalVolume = calculator4.sum()

/* Dependency Inversion */
let app1 = MyApplication.init(databaseConnection: RemoteDatabaseConnection())
app1.establishConnection()
let app2 = MyApplication.init(databaseConnection: LocalDatabaseConnection())
app2.establishConnection()
