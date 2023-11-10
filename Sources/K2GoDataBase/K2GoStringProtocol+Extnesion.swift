//
//  File.swift
//  
//
//  Created by Anand  on 11/11/23.
//

import Foundation

public extension StringProtocol {
    
    var k2GoHtml2AttributedString: NSAttributedString? {
        return Data(utf8).k2GoHtml2AttributedString
    }
    
    var k2GoHtml2String: String {
        k2GoHtml2AttributedString?.string ?? ""
    }
    
    var k2GoConvertToAttributedString: NSAttributedString? {
        let modifiedFontString = "<span style=\"font-family: Avenir-Light; font-size: 14; color: rgb(60, 60, 60)\">" + self + "</span>"
        return modifiedFontString.k2GoHtml2AttributedString
    }
    
    var k2GoconvertToAttributedStringWithMinFont: NSAttributedString? {
        let modifiedFontString = "<span style=\"font-family: Avenir-Light; font-size: 12; color: rgb(60, 60, 60)\">" + self + "</span>"
        return modifiedFontString.k2GoHtml2AttributedString
    }
}
