//
//  HomeRouter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class HomeItemRouter: HomeItemRouterProtocol {
    static var storyboard: UIStoryboard {
       return UIStoryboard(name: "Home", bundle: nil)
    }
    
    static func createHomeItemModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "HomeItemViewController") as! UINavigationController
        
        guard let homeItemVC = navController.topViewController as? HomeItemViewController else { fatalError("Invalid View Controller")}
                
        let homePresenter = HomeItemPresenter(view: homeItemVC)
        let router = HomeItemRouter()
        let homeInteractor = HomeInteractor()
        
        homeItemVC.presenter = homePresenter
        homePresenter.router = router
        homePresenter.interactor = homeInteractor
        homeInteractor.presenter = homePresenter
        
        return navController
    }
    
    func presentToPhotos(from: HomeItemViewProtocol, album: AlbumModel) {
        let photosVC = PhotosRouter.createPhotosRouterModule(album: album)
        
        guard let viewVC = from as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.navigationController?.pushViewController(photosVC, animated: true)
    }
}
