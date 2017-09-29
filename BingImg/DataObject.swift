//
//  Image.swift
//  BingImages
//
//  Created by saisri on 9/19/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit
import SwiftyJSON

class DataObject: NSObject {
    
    var name: String!
    var date: String!
    var width: Int!
    var height: Int!
    var url: NSURL!
    var id: String!
    var accentColor: UIColor!
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
    
    func parseJSON(imageJson: JSON){
        name = imageJson["name"].stringValue
        //date = NSDate().dateFromString(imageJson["datePublished"].stringValue)
        date = imageJson["datePublished"].stringValue
        width = imageJson["width"].intValue
        height = imageJson["height"].intValue
        url = NSURL(string: imageJson["contentUrl"].stringValue)
        id = imageJson["imageId"].stringValue
        //print(url.absoluteURL)
        
        if let colorString = imageJson["accentColor"].string {
            let color = colorString as NSString
            let red = color.substringWithRange(NSRange(location: 0, length: 2))
            let green = color.substringWithRange(NSRange(location: 2, length: 2))
            let blue = color.substringWithRange(NSRange(location: 4, length: 2))
            
            let r = Int(red, radix: 16)
            let g = Int(green, radix: 16)
            let b = Int(blue, radix: 16)
            
            accentColor = UIColor(colorLiteralRed: Float(r!)/255, green: Float(g!)/255, blue: Float(b!)/255, alpha: 1)
        }
        
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

    }
}