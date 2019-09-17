//
//  HomeViewController.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//
import os
import UIKit

class HomeItemViewController: UITableViewController, HomeItemViewProtocol {
    
    var presenter: HomeItemPresenterProtocol!
    var albums: [AlbumModel] = []
    
    var indicator: UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.style = .gray
        indicator.center = self.view.center
        indicator.hidesWhenStopped = false
        self.parent?.view.addSubview(indicator)
        return indicator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("viewDidLoad", log: OSLog.default, type: .info)
        presenter.loadDataFromStore()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadAlbums()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumElement = albums[indexPath.row]
        self.presenter.showPhotos(album: albumElement)
    }
    
    func showLoading() {
        print("showLoading")
        self.indicator.startAnimating()
    }
    
    func stopLoading() {
        print("stopLoading")
        self.indicator.stopAnimating()
    }
    
    func refreshTableView(albums: [AlbumModel]) {
        self.albums = albums
        self.tableView.reloadData()
    }
    
    private func setupView(){
        tableView.tableFooterView = UIView()
    }
    
    func showAlert(with: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: with, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
