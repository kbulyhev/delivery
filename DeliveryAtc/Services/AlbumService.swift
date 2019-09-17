//
//  PhotoService.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 08/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import AFNetworking
import os

protocol AlbumServiceProtocol: class {
    func loadAllAlbums(callback: @escaping ([AlbumModel]?, Error?) -> Swift.Void)
    func loadPhostosByAlbumId(albumId: Int, callback: @escaping ([PhotoModel]?, Error?) -> Swift.Void)
    func loadListOfImages(photos: [PhotoModel], callback: @escaping (UIImage) -> Swift.Void)
}

class AlbumService: AbstractApiService, AlbumServiceProtocol {
    
    func loadAllAlbums(callback: @escaping ([AlbumModel]?, Error?) -> Void) {
        loadGetData(url: "https://jsonplaceholder.typicode.com/albums",
                    modelType: AlbumModel.self, callback: callback)
    }
    
    func loadPhostosByAlbumId(albumId: Int, callback: @escaping ([PhotoModel]?, Error?) -> Void) {
        loadGetData(url: "https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)",
                    modelType: PhotoModel.self, callback: callback)
    }
    
    func loadListOfImages(photos: [PhotoModel], callback: @escaping (UIImage) -> Swift.Void) {
//        let urls = photos.map({(value: PhotoModel) -> String in
//            return value.url
//        })
        
        
        for photo in photos {
             let URL_IMAGE = URL(string: photo.url)
            
            let session = URLSession(configuration: .default)
            
            let getImageFromUrl = session.dataTask(with: URL_IMAGE!, completionHandler: {(data, response, error) in
                //if there is any error
                if let e = error {
                    //displaying the message
                    print("Error Occurred: \(e)")
                    
                } else {
                    //in case of now error, checking wheather the response is nil or not
                    if (response as? HTTPURLResponse) != nil {
                        
                        //checking if the response contains an image
                        if let imageData = data {
                            
                            //getting the image
                           
                            //displaying the image
                            
                
//                            print(photo.url)
                            if let aa = UIImage(data: imageData) {
                                callback(aa)
                            }
                            
                        
                            
                        } else {
                            print("Image file is currupted")
                        }
                    } else {
                        print("No response from server")
                    }
                }
            })
            

            //starting the download task
            getImageFromUrl.resume()
        }
        
    }
    
}
