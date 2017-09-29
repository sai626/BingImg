//
//  TestData.swift
//  BingImages
//
//  Created by saisri on 9/19/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit

class TestData2 {
    
    var data = [DataObject]()
    
    /*Source URL :- https://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=yrKu6oqsnVqRpMJZjz3CjNH-H_cwD4U8SY-E6m05x2s&v=1&r=https%3a%2f%2fwww.bing.com%2fimages%2fsearch%3fq%3dabstract%2520art%26FORM%3dOIIARP&p=DevEx,5254.1
 */
    func initialize() {
        let row1 = DataObject()
        row1.name = "Test 0"
        row1.url = NSURL(string: "http://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=kEGTqKQu94cpuzOOM4v4LMyVda5g32cdPcANalCLjaA&v=1&r=http%3a%2f%2f1.bp.blogspot.com%2f-rtuWyqGPY98%2fUKCPpM3ifpI%2fAAAAAAAAASI%2fM_OYkOrk2KE%2fs1600%2fnew_york_city_art_abstract_painting_by_debra_hurd_69b92f9568dcc6f594970223cec6df0e.jpg&p=DevEx,5009.1")
        row1.height = 425
        row1.width = 417
        row1.id = "BCD795FAB87AF3E1663E59D55B8C9910F701F683"
        //row1.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.2, green: 0.9, blue: 0.5, alpha: 1)
        data.append(row1)
        
        let row2 = DataObject()
        row2.name = "Test 1"
        row2.url = NSURL(string: "http://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=sQgTM-x2qodT6q4KyF47dFEIdEo7jUyxmiR6HH_DPBE&v=1&r=http%3a%2f%2fwww.swarez.co.uk%2fwp-content%2fuploads%2f2011%2f04%2fnothing-can-keep-abstract-art-7.jpg&p=DevEx,5015.1")
        row2.id = "6F37F6349F700B444CD5D405C5D56EB0D2EEEC34"
        row2.height = 325
        row2.width = 402
        //row2.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.5, green: 0.2, blue: 0.1, alpha: 1)
        data.append(row2)
        
        let row3 = DataObject()
        row3.name = "Test 2"
        row3.url = NSURL(string: "http://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=rHZAHJMyfus51Q4VNfedZ__fkenPsso5ZRG9qOwSDoU&v=1&r=http%3a%2f%2fcdn.dailypainters.com%2fpaintings%2fsouthern_breeze___original_abstract_painting_by_te_abstract_art__abstract__345e04ecb89804fe36cb5281699992d6.jpg&p=DevEx,5021.1")
        row3.id = "0D2A39EEDD8B946B7C2EF7CF4E9D6FC615EA5931"
        row3.height = 462
        row3.width = 475
        //row3.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.33, green: 0.66, blue: 0.4, alpha: 1)
        data.append(row3)
        
        let row4 = DataObject()
        row4.name = "Test 3"
        row4.url = NSURL(string: "http://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=KhP94SsTBMRre90ENM8Qz-9joIt6gniU_nuIU7GbiG8&v=1&r=http%3a%2f%2fwww.osnatfineart.com%2fpaintings%2f15-10%2f15-10-blue-red-contemporary-abstract-art-home-decor_tn.jpg&p=DevEx,5027.1")
        row4.id = "9558C7D8A8FB9E62DF1A9637966011047BAE15E0"
        row4.height = 334
        row4.width = 334
        //row4.imageSizeCalc()
        row1.accentColor = UIColor(red: 0.4, green: 0.7, blue: 0.55, alpha: 1)
        data.append(row4)
        
        let row5 = DataObject()
        row5.name = "Test 4"
        row5.url = NSURL(string: "http://www.bing.com/cr?IG=D52594E9BC5347A3B762A69FBFF727B6&CID=18F9C143A66F6E4C32CACA4BA78A6F77&rd=1&h=aDKZyfbCg5x-6d6WOiYNe0E4PbEQhLCySizDcltuKvs&v=1&r=http%3a%2f%2fwww.view4ia.com%2ffiles%2f2011%2f12%2fabstract-paintings.jpg&p=DevEx,5033.1")
        row5.id = "1E6E50D5FA1FCD602F504D3D4F16E7415983F6FB"
        row5.height = 400
        row5.width = 400
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
