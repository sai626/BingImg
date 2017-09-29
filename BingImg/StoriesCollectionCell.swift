//
//  StoriesCollectionCell.swift
//  BingImg
//
//  Created by saisri on 9/27/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import Foundation
import UIKit

class StoriesCollectionCell: UICollectionViewCell {
    
    var collectionView: UICollectionView?
    let testData = TestProfileImage()
    
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 60)
        layout.scrollDirection = .Horizontal
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerNib(UINib(nibName: "MyStoryCell", bundle: nil), forCellWithReuseIdentifier: "myStoryCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView!.showsHorizontalScrollIndicator = false
        self.addSubview(collectionView!)
        
        testData.initialize()
    }
}

extension StoriesCollectionCell: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myStoryCell", forIndexPath: indexPath) as! MyStoryCell
        
        cell.initializeCellWithData(testData.data[indexPath.row])
        
        return cell
    }
}

extension StoriesCollectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}