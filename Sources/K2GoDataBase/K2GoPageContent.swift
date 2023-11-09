//
//  K2GoPageContent.swift
//  
//
//  Created by Anand  on 09/11/23.
//

import UIKit
import RealmSwift
import Realm

class K2GoPageContent: Object, Decodable {

    @objc dynamic var name: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var coursemodule: Int = 0
    @objc dynamic var course: Int = 0
    @objc dynamic var content: String = ""

    @objc dynamic var contentfiles:[K2GoPageFile]? = []

    override static func primaryKey() -> String? { return "id" }

}

class K2GoPageFile: Object, Decodable {
    
    @objc dynamic var filename: String = ""
    @objc dynamic var fileurl: String = ""
    @objc dynamic var mimetype: String = ""
    
}
