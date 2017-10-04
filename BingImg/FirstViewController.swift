//
//  FirstViewController.swift
//  BingImg
//
//  Created by saisri on 9/27/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit
import RealmSwift

protocol ViewControllerDelegate {
    func updateLayout()
    func getRealm() -> Realm
}

class FirstViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ViewControllerDelegate {
    
    var dataObjects = [DataObject]()
    let searchString = "Pink Floyd"
    let webRequest = WebRequest()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        //testData.initialize()
        
        collectionView?.registerNib(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "dataCell")
        
        let URL = webRequest.generateQueryURL(searchString)
        dataObjects = Array(realm.objects(DataObject.self))
        collectionView?.reloadData()
        
        webRequest.getDataObjects(URL!){
            
            objects in
            self.dataObjects = objects
            //print(self.dataObjects.count)
            self.collectionView?.reloadData()
            
            try! self.realm.write{
                self.realm.delete(self.realm.objects(DataObject.self))
            }
            
            for obj in self.dataObjects {
                try! self.realm.write{
                    self.realm.add(obj)
                }
            }
            
        }
        
        
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
            //print(indexPath.row)
            cell.initializeCellWithDataOfCollectionView(self, data: dataObjects[indexPath.row - 1])
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.mainScreen().bounds.width, height: 60)
        }else {
            return CGSize(width: UIScreen.mainScreen().bounds.width, height: CGFloat(dataObjects[indexPath.row - 1].imageHeight + 65))
        }
    }
    
    func updateLayout() {
        print("Invalidating layout")
        collectionView!.collectionViewLayout.invalidateLayout()
    }
    
    func getRealm() -> Realm{
        return realm
    }
}

