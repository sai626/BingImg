//
//  FirstViewController.swift
//  BingImg
//
//  Created by saisri on 9/27/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit

class FirstViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var dataObjects = [DataObject]()
    let searchString = "Abstract Monochrome"
    let webRequest = WebRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        //testData.initialize()
        
        collectionView?.registerNib(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "dataCell")
        
        let URL = webRequest.generateQueryURL(searchString)
        
        webRequest.getDataObjects(URL!){
            
            objects in
            self.dataObjects = objects
            //print(self.dataObjects.count)
            self.collectionView?.reloadData()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataObjects.count + 1
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("firstCell", forIndexPath: indexPath) as! StoriesCollectionCell
            cell.initialize()
            return cell
        }else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dataCell", forIndexPath: indexPath) as! ImageCell
            print(indexPath.row)
            cell.initializeCellWithData(dataObjects[indexPath.row - 1])
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.mainScreen().bounds.width, height: 60)
        }else {
            return CGSize(width: UIScreen.mainScreen().bounds.width, height: CGFloat(dataObjects[indexPath.row - 1].height + 60))
        }
    }
}

