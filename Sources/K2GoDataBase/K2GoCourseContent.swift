//
//  K2GoCourseContent.swift
//  
//
//  Created by Anand  on 09/11/23.
//

import UIKit
import RealmSwift

public class K2GoCourseContent: Object, Decodable {
    
    @objc dynamic public var name: String = ""
    @objc dynamic public var id: Int = 0
    @objc dynamic public var visible: Int = 0
    @objc dynamic public var summary: String = ""
    @objc dynamic public var isFavorite: Bool = false

    public var modules = List<K2GoCourseModule>()
    
    public var sessions = List<String>()
    public var content = List<K2GoTopic>()
    public override static func primaryKey() -> String? { return "id" }

}

public class K2GoCourseModule: Object, Decodable {
    
    @Persisted public var id: Int = 0
    @Persisted public var url: String = ""
    @Persisted public var name: String = ""
    @Persisted public var visible: Int = 0
    @Persisted public var contextid: Int = 0
}

public class  K2GoTopic: Object, Decodable  {
    
    @Persisted public var header: String = ""
    @Persisted public var content: String = ""
    @Persisted public var isSelected: Bool = false
}
