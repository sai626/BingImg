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
import RealmSwift

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var nameOfImage: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var imageViewer: UIImageView!

    var data: DataObject?
    let cache = ImageCache()
    var delegate: ViewControllerDelegate!
    
    let webRequest = WebRequest()
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImageViewer() {
        //imageViewer.backgroundColor = UIColor.blackColor()
        imageViewer.backgroundColor = data!.accentColor
        if let image = cache.retriveImage(data!.id,encodingFormat: data!.encodingFormat) {
            imageViewer.image = image
        }else{
            webRequest.downloadImage(data!.url){
                [weak self] image in
                if let image = image, let strongSelf = self {
                    dispatch_async(dispatch_get_main_queue()){
                        
                        let imgAspectRatio = image.size.height / image.size.width
                        let dataAspectRatio = CGFloat((strongSelf.data?.height)!)/CGFloat((strongSelf.data?.width)!)
                        
                        print("\(imgAspectRatio)   \(dataAspectRatio)")
                        if (imgAspectRatio != dataAspectRatio) {
                            
                            let realm = strongSelf.delegate.getRealm()
                            
                            try! realm.write{
                                strongSelf.data?.height = Int(image.size.height)
                                strongSelf.data?.width = Int(image.size.width)
                            }
                            
                            strongSelf.imageViewer.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: (strongSelf.data?.imageHeight)!)
                            strongSelf.delegate.updateLayout()
                        }
                        
                        strongSelf.imageViewer.image = image
                        
                    }
                    strongSelf.cache.saveImage(strongSelf.data!.id, image: image, encodingFormat: strongSelf.data!.encodingFormat)
                }
            }
        }
        
    }
    
    func initializeCellWithDataOfCollectionView(delegate: ViewControllerDelegate, data: DataObject) {
        self.delegate = delegate
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
        
        if let date = data!.date {
            uploadDate.text = DateFormatter.dateFormatWithFormat("dd MMM yyyy", date: date)
        } else {
            uploadDate.hidden = true
        }
        
        imageViewer.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: (data?.imageHeight)!)
        setImageViewer()
    }
    
}
