
import Foundation
import RealmSwift

public struct RealmManager {
    static func setup() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            inMemoryIdentifier: "K2GO",
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    //write the migration logic here
                }
            })
    }
}


public class RealmManagerDB {
    public let realm = try? Realm()
    
    public func deleteDatabase() {
        try? realm?.write({
            realm?.deleteAll()
        })
    }
    
    public func deleteObject(objs: Object) {
        try? realm!.write ({
            realm?.delete(objs)
        })
    }
    
    public func saveObjects(objs: Object) {
        try? realm!.write ({
            realm?.add(objs, update: .error)
        })
    }
    
    public func editObjects(objs: Object) {
        try? realm!.write ({
            realm?.add(objs, update: .all)
        })
    }
    
    public func getObjects(type: Object.Type) -> Results<Object>? {
        return realm!.objects(type)
    }
    
}
