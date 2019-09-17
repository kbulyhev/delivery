
//
//  PhotosInteractor.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation
import UIKit

class PhotosInteractor: PhotosInteractorProtocol {
    weak var presenter: PhotosPresenterProtocol!
    var albumService = AlbumService()
    
    func loadPhostosByAlbumId(albumId: Int) {
        self.albumService.loadPhostosByAlbumId(albumId: albumId, callback: {(model, error) in
            if(model != nil){
                self.presenter.stopLoading()
                var ad: [UIImage] = []
                let images = self.albumService.loadListOfImages(photos: model!, callback: {(image) in
                    ad.append(image)
                    self.presenter.showGallery(image: image)
                })
//
//                self.presenter.showGallery(photos: model!)
            } else {
                self.presenter.showAlert(text: "Ошибка выполнения запроса, попробуйте позже")
            }
        })
    }
}
