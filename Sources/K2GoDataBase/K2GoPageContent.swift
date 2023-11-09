//
//  K2GoPageContent.swift
//  
//
//  Created by Anand  on 09/11/23.
//

import UIKit
import RealmSwift
import Realm

public class K2GoPageContent: Object, Decodable {

    @objc dynamic public var name: String = ""
    @objc dynamic public var id: Int = 0
    @objc dynamic public var coursemodule: Int = 0
    @objc dynamic public var courseId: Int = 0
    @objc dynamic public var content: String = ""
     public var contentfiles = List<K2GoPageFile>()
    //[K2GoPageFile]? = []

    public override static func primaryKey() -> String? { return "id" }

}

public class K2GoPageFile: Object, Decodable {
    
    @Persisted public var filename: String = ""
    @Persisted public var fileurl: String = ""
    @Persisted public var mimetype: String = ""
    
}
