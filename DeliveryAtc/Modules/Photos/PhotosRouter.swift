//
//  PhotosRouter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class PhotosRouter: PhotosRouterProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Photos", bundle: nil)
    }
    
    static func createPhotosRouterModule(album: AlbumModel) -> UIViewController {
        let photosVC = storyboard.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
        
        let presenter = PhotosPresenter(view: photosVC)
        let router = PhotosRouter()
        let interactor = PhotosInteractor()
        
        photosVC.albumModel = album
        photosVC.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return photosVC
    }
    
}
