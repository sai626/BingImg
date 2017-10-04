//
//  Image.swift
//  BingImages
//
//  Created by saisri on 9/19/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class DataObject: Object {
    
    dynamic var name: String!
    dynamic var date: NSDate?
    dynamic var width = 0
    dynamic var height = 0
    dynamic var urlString: String!
    dynamic var id: String!
    dynamic var encodingFormat: String!
    dynamic var aColor: String?
    var webSearchURL: NSURL?
    var thumbnailUrl: NSURL?
    var thumbnailWidth: Int?
    var thumbnailHeight: Int?
    var imageSize: Int?
    //TODO:- Date to NSDate
    //private let MAX_IMAGE_HEIGHT = CGFloat(200)
    
    var imageHeight: CGFloat!{
        get{
            let aspectRatio = CGFloat(height)/CGFloat(width)
            return aspectRatio * UIScreen.mainScreen().bounds.width
        }
    }
    
    var imageWidth: CGFloat!{
        get{
            return UIScreen.mainScreen().bounds.width
        }
    }
    var url: NSURL! {
        return NSURL(string: urlString)
    }
    
    var accentColor: UIColor! {
        get {
            let color = aColor! as NSString
            let red = color.substringWithRange(NSRange(location: 0, length: 2))
            let green = color.substringWithRange(NSRange(location: 2, length: 2))
            let blue = color.substringWithRange(NSRange(location: 4, length: 2))
            
            let r = Int(red, radix: 16)
            let g = Int(green, radix: 16)
            let b = Int(blue, radix: 16)
            
            return UIColor(colorLiteralRed: Float(r!)/255, green: Float(g!)/255, blue: Float(b!)/255, alpha: 1)
        }
    }
    
    func parseJSON(imageJson: JSON){
        name = imageJson["name"].stringValue        
        date = DateFormatter.stringParseWithFormat("yyyy-MM-dd'T'HH-mm-ss", string: imageJson["datePublished"].stringValue)
        
        width = imageJson["width"].intValue
        height = imageJson["height"].intValue
        urlString = imageJson["contentUrl"].stringValue
        id = imageJson["imageId"].stringValue
        //print(url.absoluteURL)
        
        aColor = imageJson["accentColor"].string
        
        if let urlString = imageJson["webSearchUrl"].string{
            webSearchURL = NSURL(string: urlString)
        }
        
        if let urlString = imageJson["thumbnailUrl"].string{
            thumbnailUrl = NSURL(string: urlString)
        }
        
        thumbnailWidth = imageJson["thumbnail"]["width"].int
        thumbnailHeight = imageJson["thumbnail"]["height"].int
        
        if let sizeString = imageJson["contentSize"].string{
            let value = sizeString.characters.split(" ").map(String.init)
            imageSize = Int(value[0])
        }
        
        encodingFormat = imageJson["encodingFormat"].stringValue

    }
    
    override static func ignoredProperties() -> [String] {
        return ["webSearchURL", "thumbnailUrl", "thumbnailWidth", "thumbnailHeight", "imageSize"]
    }
}