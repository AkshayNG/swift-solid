import Foundation

struct DatabaseConnection {
    var host: String
    var username: String
    var password: String
    var databaseName: String
}

//low-level module
class RemoteDatabaseConnection {
    
    func connect() {
        let db = DatabaseConnection.init(host: "https://remote.com", username: "akshay", password: "12345", databaseName: "Users")
        print(db)
    }
    
}

//high-level module
class MyApplication {
    
    var remoteConnection: RemoteDatabaseConnection
    
    /*
    Imagine we have to use Local database connection instead of remote.
    Then we will have to change this MyApplication class, which will violet open-closed principle.
    On other hand, this class (as client) directly accessing concrete implmentation RemoteDatabaseConnection which violets Dependency Inversion
    */
    init(remoteConnection: RemoteDatabaseConnection) {
        self.remoteConnection = remoteConnection
    }
}
