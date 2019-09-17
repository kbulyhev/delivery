
//
//  HomeInteractor.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit
import os

class HomeInteractor: HomeItemInteractorProtocol {
    private let albumsStorageKey = "ALBUMS"
    
    weak var presenter: HomeItemPresenterProtocol!
    var albumService = AlbumService()
    var storageService = StorageService()
    
    
    func loadAlbums() {   
        print("laoding")
        albumService.loadAllAlbums(callback: {(model, error) in
            if model != nil {
                self.presenter.stopLoading()
                self.storageService.saveDataInStorage(data: model, key: self.albumsStorageKey)
                self.presenter.showAlbmusList(albums: model!)
            } else if error != nil {
                self.presenter.showAlert(message: "Ошибка выполнения запроса, попробуйте позже")
            }
        })
    }
    
    func loadDataFromStore() -> [AlbumModel]{
        os_log("Получение данных из стора...", log: OSLog.default, type: .info)
        let storageData = storageService.loadArrayDataByKey(key: albumsStorageKey, type: [AlbumModel].self)
        
        if(storageData != nil){
            return storageData!
        } else {
            return []
        }
    }
    
    func hasStorageData() -> Bool {
       return self.storageService.hasStorageData(key: albumsStorageKey)
    }
    
}
