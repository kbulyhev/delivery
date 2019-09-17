
//
//  PhotosProtocols.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol PhotosViewControllerProtocol: class {
    var photos: [PhotoModel] {set get}
    func stopLoading()
    func showGallery(image: UIImage)
    func showAlert(text: String)
}

protocol PhotosPresenterProtocol: class {
    func loadPhostosByAlbumId(albumId: Int)
    func stopLoading()
    func showGallery(image: UIImage)
    func showAlert(text: String)
}

protocol PhotosInteractorProtocol:  class {
     func loadPhostosByAlbumId(albumId: Int)
}

protocol PhotosRouterProtocol: class {
   static func createPhotosRouterModule(album: AlbumModel) -> UIViewController
}
