//
//  HomePresenter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class HomeItemPresenter: HomeItemPresenterProtocol {

    weak var view: HomeItemViewProtocol!
    var router: HomeItemRouterProtocol!
    var interactor: HomeItemInteractorProtocol!
    
    required init(view: HomeItemViewProtocol) {
        self.view = view
    }
    
    func loadAlbums() {
        if(self.view.albums.count == 0){
            if(self.interactor.hasStorageData()){
                let data = interactor.loadDataFromStore()
                view.refreshTableView(albums: data)
            } else {
                view.showLoading()
                interactor.loadAlbums()
            }
        }
//        interactor.loadAlbums()
    }
    
    func showLoading() {
        view.showLoading()
    }
    
    func stopLoading() {
        view.stopLoading()
    }
    
    func showAlbmusList(albums: [AlbumModel]) {
        self.view.albums = albums
        view.refreshTableView(albums: albums)
    }
    
    func loadDataFromStore() {
        let ablumsArray = interactor.loadDataFromStore()
        view.refreshTableView(albums: ablumsArray)
    }
    
    func showAlert(message: String) {
        view.showAlert(with: message)
    }
    
    func showPhotos(album: AlbumModel) {
        self.router.presentToPhotos(from: view, album: album)
    }
    
}
