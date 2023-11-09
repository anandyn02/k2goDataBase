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

    @objc public dynamic var name: String = ""
    @objc public dynamic var id: Int = 0
    @objc public dynamic var coursemodule: Int = 0
    @objc public dynamic var courseId: Int = 0
    @objc public dynamic var content: String = ""
    @objc public dynamic var contentfiles:[K2GoPageFile]? = []

    public override static func primaryKey() -> String? { return "id" }

}

public class K2GoPageFile: Object, Decodable {
    
    @objc public dynamic var filename: String = ""
    @objc public dynamic var fileurl: String = ""
    @objc public dynamic var mimetype: String = ""
    
}
