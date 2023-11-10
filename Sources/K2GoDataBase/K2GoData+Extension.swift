//
//  File.swift
//  
//
//  Created by Anand  on 11/11/23.
//

import Foundation

public extension Data {
    var k2GoHtml2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
     
    var k2goHtml2String: String { k2GoHtml2AttributedString?.string ?? "" }
}
