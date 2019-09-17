//
//  PhotosPresenter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class PhotosPresenter: PhotosPresenterProtocol {
    weak var view: PhotosViewControllerProtocol!
    var router: PhotosRouterProtocol!
    var interactor: PhotosInteractorProtocol!
    
    init(view: PhotosViewControllerProtocol) {
        self.view = view
    }
    
    func loadPhostosByAlbumId(albumId: Int) {
        self.interactor.loadPhostosByAlbumId(albumId: albumId)
    }
    
    func stopLoading() {
        view.stopLoading()
    }
    
    func showGallery(image: UIImage) {
        self.view.showGallery(image: image)
    }
    
    func showAlert(text: String) {
        view.showAlert(text: text)
    }
}
