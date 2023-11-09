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

    @Persisted public var name: String = ""
    @Persisted public var id: Int = 0
    @Persisted public var coursemodule: Int = 0
    @Persisted public var courseId: Int = 0
    @Persisted public var content: String = ""
  //  @Persisted public var contentfiles = List<K2GoPageFile>()
    //[K2GoPageFile]? = []

    public override static func primaryKey() -> String? { return "id" }

}

public class K2GoPageFile: Object, Decodable {
    
    @Persisted public var filename: String = ""
    @Persisted public var fileurl: String = ""
    @Persisted public var mimetype: String = ""
    
}
