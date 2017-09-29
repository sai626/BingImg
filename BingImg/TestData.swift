//
//  TestData.swift
//  BingImages
//
//  Created by saisri on 9/19/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit

class TestData {
    
    var data = [DataObject]()
    
    func initialize() {
        let row1 = DataObject()
        row1.name = "Test 0"
        row1.url = NSURL(string: "https://www.bing.com/cr?IG=1CAFD5814FB94AF39827899BB453C71B&CID=2DB655174DBC61A800AB5E144C7C60D3&rd=1&h=1swxeCoemXYd9LjaeAyH-vmUcqZo7WEtZ5PlUgK1Ey0&v=1&r=https%3a%2f%2fc1.staticflickr.com%2f8%2f7694%2f17158667357_38d8a99341_n.jpg&p=DevEx,5009.1")
        row1.height = 240
        row1.width = 204
        //row1.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.2, green: 0.9, blue: 0.5, alpha: 1)
        data.append(row1)
        
        let row2 = DataObject()
        row2.name = "Test 1"
        row2.url = NSURL(string: "https://www.bing.com/cr?IG=1CAFD5814FB94AF39827899BB453C71B&CID=2DB655174DBC61A800AB5E144C7C60D3&rd=1&h=YvW9k5-r59O9xGsjsLgpmWvTeh8-mf61Xz-46PieuZU&v=1&r=https%3a%2f%2fstatic.pexels.com%2fusers%2favatars%2f148853%2fmitchell-cizmas-224-medium.jpeg&p=DevEx,5015.1")
        row2.height = 200
        row2.width = 200
        //row2.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.5, green: 0.2, blue: 0.1, alpha: 1)
        data.append(row2)
        
        let row3 = DataObject()
        row3.name = "Test 2"
        row3.url = NSURL(string: "http://www.bing.com/cr?IG=1CAFD5814FB94AF39827899BB453C71B&CID=2DB655174DBC61A800AB5E144C7C60D3&rd=1&h=YIcwGSG0gGzWkE2ajFqvBZlJhd5sGVUS2IHhUZciQM8&v=1&r=http%3a%2f%2fwww.publicdomainpictures.net%2fpictures%2f170000%2ft2%2fabstract-modern-3d-art.jpg&p=DevEx,5021.1")
        row3.height = 150
        row3.width = 266
        //row3.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.33, green: 0.66, blue: 0.4, alpha: 1)
        data.append(row3)
        
        let row4 = DataObject()
        row4.name = "Test 3"
        row4.url = NSURL(string: "http://www.bing.com/cr?IG=1CAFD5814FB94AF39827899BB453C71B&CID=2DB655174DBC61A800AB5E144C7C60D3&rd=1&h=6P5QXRsTEzj9gBgbaS-Z_5mLytZgWX8LK_xFJK3TUdM&v=1&r=http%3a%2f%2fimages.clipshrine.com%2fdownload%2fwheel%2fmedium-Volcanic-Frame-0-42125.png&p=DevEx,5027.1")
        row4.height = 300
        row4.width = 300
        //row4.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.4, green: 0.7, blue: 0.55, alpha: 1)
        data.append(row4)
        
        let row5 = DataObject()
        row5.name = "Test 4"
        row5.url = NSURL(string: "http://www.bing.com/cr?IG=1CAFD5814FB94AF39827899BB453C71B&CID=2DB655174DBC61A800AB5E144C7C60D3&rd=1&h=CZtaOCAIJrlcMbsnoyp2qvzHWlCNbW8PW1q77Igc7GU&v=1&r=http%3a%2f%2fimages.clipshrine.com%2fdownload%2fwheel%2fmedium-Volcanic-Frame-66.6-42125.png&p=DevEx,5033.1")
        row5.height = 300
        row5.width = 300
        //row5.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.29, green: 0.05, blue: 0.35, alpha: 1)
        data.append(row5)
        
    }
    
    func addImg(number: Int){
        let img = DataObject()
        img.name = "Test" + String(number)
        img.height = 5*number
        data.append(img)
    }
}
