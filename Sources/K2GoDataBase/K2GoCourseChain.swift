//
//  K2GoCourseChain.swift
//  
//
//  Created by Anand  on 09/11/23.
//

import UIKit
import RealmSwift

class K2GoCourseChain: Object, Decodable {
    
    @Persisted public var title: String = ""
    @Persisted public var parentName: String?
    @Persisted public var courseId: Int = 0
    
    @Persisted public var childrens = List<K2GoCourseChain>()
    @Persisted public var isExpended: Bool = false
    @Persisted public var favoriteId: Int = 0
}
