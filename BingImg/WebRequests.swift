//
//  WebRequests.swift
//  BingImages
//
//  Created by saisri on 9/21/17.
//  Copyright © 2017 Saii. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireSwiftyJSON

class WebRequest {
    
    private let subscriptionKey = "70c4dd9f5d1140ed9646d6f1c162fb9b"
    
    func downloadImage(url: NSURL, completion: (image: UIImage?)->()) -> Request{
        let request = Alamofire.request(.GET, url).responseImage {
            response in
            /*
            debugPrint(response)
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            */
            completion(image: response.result.value)
            
        }
        
        return request
    }

    func generateQueryURL(query: String) -> NSURL?{
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "api.cognitive.microsoft.com";
        urlComponents.path = "/bing/v5.0/images/search";
        // add params
        let searchQuery = NSURLQueryItem(name: "q", value: query)
        /*let conceptQuery = NSURLQueryItem(name: "concept_tags", value: "false")
        let hdQuery = NSURLQueryItem(name: "hd", value: "false")
        let apiKeyQuery = NSURLQueryItem(name: "api_key", value: API_KEY)*/
        urlComponents.queryItems = [searchQuery]
        
        return urlComponents.URL
    }
    
    func getDataObjects(url: NSURL, completion: ([DataObject]) -> ()) -> Request{
        let headers = ["Ocp-Apim-Subscription-Key":subscriptionKey]
        
        var objects = [DataObject]()
        let request = Alamofire.request(.GET, url, parameters: nil, encoding: .URL, headers: headers).responseSwiftyJSON {
            response in
            
            //debugPrint(response)
            //print(response.request)
            //print(response.response)
            //debugPrint(response.result)
            
            
            if let data = response.result.value {
                let values = data["value"].arrayValue
                var data = DataObject()
                for value in values {
                    data.parseJSON(value)
                    //print(value)
                    objects.append(data)
                    data = DataObject()
                }
                
            }
            print("Downloaded data from internet")
            completion(objects)
        }
        
        return request
    }
}