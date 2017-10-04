//
//  DateFormatter.swift
//  BingImg
//
//  Created by saisri on 10/4/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import Foundation
import UIKit

class DateFormatter {
    
    private static let parser = NSDateFormatter()
    //static let dateParser = NSDateFormatter()
    
    static func stringParseWithFormat(format: String, string: String) -> NSDate? {
        parser.dateFormat = format
        return parser.dateFromString(string)
    }
    
    static func dateFormatWithFormat(format: String, date: NSDate) -> String {
        parser.dateFormat = format
        return parser.stringFromDate(date)
    }
}