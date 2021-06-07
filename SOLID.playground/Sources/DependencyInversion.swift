import Foundation

public struct DatabaseObject {
    var host: String
    var username: String
    var password: String
    var databaseName: String
}

//low-level module
public class RemoteDatabaseConnection: DatabaseConnection {
    
    public init() {}

    public func connect() {
        let db = DatabaseObject.init(host: "https://remote.com", username: "akshay", password: "12345", databaseName: "Users")
        print("Remote connection: \(db)")
    }
    
}

public class LocalDatabaseConnection: DatabaseConnection {
    
    public init() {}
    
    public func connect() {
        let db = DatabaseObject.init(host: "https://localhost:8080", username: "root", password: "54321", databaseName: "Users")
        print("Local connection: \(db)")
    }
    
}

//Abstraction to satisfy dependency inversion
public protocol DatabaseConnection {
    func connect()
}


//high-level module
public class MyApplication {
    
    var databaseConnection: DatabaseConnection
    
    /*
    Imagine we have to use Local database connection instead of remote.
    Then we will have to change this MyApplication class, which will violet open-closed principle.
    On other hand, this class (as client) directly accessing concrete implmentation RemoteDatabaseConnection which violets Dependency Inversion
    
    init(remoteConnection: RemoteDatabaseConnection) {
        self.remoteConnection = remoteConnection
    }
    */
    
    public init(databaseConnection: DatabaseConnection) {
        self.databaseConnection = databaseConnection
    }
    
    public func establishConnection() {
        self.databaseConnection.connect()
    }
}
