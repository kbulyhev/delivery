//
//  HomeProtocol.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol HomeItemViewProtocol: class {
    var albums: [AlbumModel] {get set}
    func showLoading()
    func stopLoading()
    func refreshTableView(albums: [AlbumModel])
    func showAlert(with: String)
}

protocol HomeItemRouterProtocol: class {
    static func createHomeItemModule() -> UIViewController
    func presentToPhotos(from: HomeItemViewProtocol, album: AlbumModel)
}

protocol HomeItemPresenterProtocol: class {
    func loadAlbums()
    func showLoading()
    func stopLoading()
    func showAlbmusList(albums: [AlbumModel])
    func loadDataFromStore()
    func showAlert(message: String)
    func showPhotos(album: AlbumModel)
}

protocol HomeItemInteractorProtocol: class {
    func loadAlbums()
    func loadDataFromStore() -> [AlbumModel]
    func hasStorageData() -> Bool
}

