//
//  ImageCache.swift
//  BingImages
//
//  Created by saisri on 9/25/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
    
    let tempImageDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
    
    func saveImage(id: String, image: UIImage){
        let fileManager = NSFileManager.defaultManager()
        let paths = tempImageDirectory.stringByAppendingPathComponent("Photo_").stringByAppendingString(id)
        print(paths)
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFileAtPath(paths as String, contents: imageData, attributes: nil)
    }
    
    func retriveImage(id: String) -> UIImage?{
        let fileManager = NSFileManager.defaultManager()
        let imagePAth = tempImageDirectory.stringByAppendingPathComponent("Photo_").stringByAppendingString(id)
        if fileManager.fileExistsAtPath(imagePAth){
            return UIImage(contentsOfFile: imagePAth)
        }else{
            return nil
        }
    }    
}