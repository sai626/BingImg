//
//  ImageCell.swift
//  BingImages
//
//  Created by saisri on 9/18/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import Foundation

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var nameOfImage: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var imageViewer: UIImageView!

    var data: DataObject?
    let cache = ImageCache()
    
    let webRequest = WebRequest()
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImageViewer() {
        //imageViewer.backgroundColor = UIColor.blackColor()
        imageViewer.backgroundColor = data!.accentColor
        if let image = cache.retriveImage(data!.id) {
            imageViewer.image = image
        }else{
            webRequest.downloadImage(data!.url){
                [weak self] image in
                if let image = image, let strongSelf = self {
                    dispatch_async(dispatch_get_main_queue()){
                        strongSelf.imageViewer.image = image
                    }
                    strongSelf.cache.saveImage(strongSelf.data!.id, image: image)
                }
            }
        }
        
    }
    
    func initializeCellWithData(data: DataObject){
        self.data = data
        updateUI()
    }
    
    override func prepareForReuse() {
        data = nil
        nameOfImage.text = nil
        uploadDate.text = nil
        imageViewer.image = nil
        imageViewer.backgroundColor = UIColor.whiteColor()
        request?.cancel()
        //print("Cancelled image at index \(index!)")
    }
    
    func updateUI(){
        nameOfImage.text = data!.name
        uploadDate.text = "Random Text"
        imageViewer.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: (data?.imageHeight)!)
        setImageViewer()
    }
    
}
