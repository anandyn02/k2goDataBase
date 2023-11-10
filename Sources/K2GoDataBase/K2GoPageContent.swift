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
    public var contentData: Data?
    public var regularContent: String = ""

    //[K2GoPageFile]? = []

    public override static func primaryKey() -> String? { return "id" }
    
    
   public func convertIntoAttributeString() {
        
        if let attributedString = content.k2GoConvertToAttributedString {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: attributedString, requiringSecureCoding: false)
                contentData = data
            }
            catch {
                print("error encoding")
            }
        }
    }
    
    public func convertHtmlToRegular() {
        let str = content.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        regularContent = str
    }
    
    public func getAttributedString() -> NSAttributedString? {
        if let data = contentData {
            do {
                let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
                unarchiver.requiresSecureCoding = false
                let decodedAttributedString = unarchiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! NSAttributedString
                return decodedAttributedString
            } catch {
                print("error decoding")
            }
        }
        
        return nil
       
    }

}

public class K2GoPageFile: Object, Decodable {
    
    @Persisted public var filename: String = ""
    @Persisted public var fileurl: String = ""
    @Persisted public var mimetype: String = ""
    
}
