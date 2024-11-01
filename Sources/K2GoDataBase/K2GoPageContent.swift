//
//  K2GoPageContent.swift
//  
//
//  Created by Anand  on 09/11/23.
//

import UIKit
import RealmSwift
import Realm

public struct TextContentPage {
    public init() {}
    
    public var text: String = ""
    public var url: String = ""
}

public class  K2GoTextContentPage: Object, Decodable {
    @objc dynamic public var text: String = ""
    @objc dynamic public var url: String = ""
}

public class K2GoPageContent: Object, Decodable {

    @objc dynamic public var name: String = ""
    @objc dynamic public var id: Int = 0
    @objc dynamic public var coursemodule: Int = 0
    @objc dynamic public var courseId: Int = 0
    @objc dynamic public var content: String = ""
    @objc dynamic public var contentData: Data?
    @objc dynamic public var regularContent: String = ""

    public var contentfiles = List<K2GoPageFile>()
    public var images = List<String>()
    public var videos = List<String>()
    public var textContent = List<K2GoTextContentPage>()
    
    @objc dynamic public var parentName: String?
    @objc dynamic public var parentId: Int = 0
    @objc dynamic public var fullPath: String?

    
    public var searchText: String = "" {
        didSet {
            updateSearchText()
        }
    }
    
   private(set) public var searchResult: String = ""

    //[K2GoPageFile]? = []

    public override static func primaryKey() -> String? { return "id" }
    
    public func updateFileContent() {
        
        images.removeAll()
        videos.removeAll()
        
        for fle in contentfiles {
            if fle.mimetype == "image/png" ||  fle.mimetype == "image/jpg" {
                images.append(fle.fileurl)
            }
            else if fle.mimetype == "video/mp4" {
                videos.append(fle.fileurl)
            }
        }
    }
    
    public func updateTextContent(list: [TextContentPage]) {
        
        for i in list {
            let info = ["text": i.text, "url": i.url]
            let contentPage = K2GoTextContentPage(value: info)
            textContent.append(contentPage)
        }
    }
    
    public func updateSearchText() {
        searchResult = regularContent.k2GoSpotSearchText(searchText) ?? ""
    }
    
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
