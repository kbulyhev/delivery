//
//  PhotosViewController.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit
import Photos
import os

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PhotosViewControllerProtocol {
    var presenter: PhotosPresenterProtocol!
    var albumModel: AlbumModel!
    var myCollectionView: UICollectionView!
    var photos: [PhotoModel] = []
    var imageArray: [UIImage] = [UIImage(named: "icons8-home-50")!, UIImage(named: "icons8-new-message-30")!]
    
    deinit {
        os_log("destroy PhotosViewController", log: OSLog.default, type: .info)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        self.presenter.loadPhostosByAlbumId(albumId: albumModel.id)
    }
    
    func stopLoading() {
        
    }
    
    func showGallery(image: UIImage) {
        imageArray.append(image)
         DispatchQueue.main.async {
            self.myCollectionView.reloadData()
        }
    }
    
    func showAlert(text: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: text, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoItemCell
        cell.img.image=imageArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let vc=ImagePreviewVC()
        vc.imgArray = self.imageArray
        vc.passedContentOffset = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func initView(){
        self.title = "Photos"
        let layout = UICollectionViewFlowLayout()
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(PhotoItemCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.backgroundColor=UIColor.white
        self.view.addSubview(myCollectionView)
        
        myCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
        
    }
    
}

class PhotoItemCell: UICollectionViewCell {
    
    var img = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds=true
        self.addSubview(img)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
