// PhotosFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Экран с фотографиями пользователя
final class PhotosFriendViewController: UIViewController {
    
    // MARK: - Private @IBOutlet
    @IBOutlet private var photoTableView: UITableView!
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let photoTestID = "photoFriends"
    }
    
    // MARK: - Private Properies
    
    private let networkService = NetworkService()
    private var photos: [Photo] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }
    
    // MARK: - Private Methods
    
    private func fetchPhotos() {
        networkService.fetchUserPhotos { [weak self] result in
            switch result {
            case let .success(photo):
                self?.photos = photo.response.photos
                self?.photoTableView.reloadData()
            case let .failure(error):
                error.localizedDescription
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension PhotosFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.photoTestID,
            for: indexPath
        ) as? PhotoFriendsTableViewCell
        else { return UITableViewCell() }
        
        guard let imageURL = URL(string: photos[indexPath.row].sizes.first?.url ?? "")
        else { return UITableViewCell() }
        
        DispatchQueue.main.async {
            cell.configure(imageURL: imageURL)
        }
        return cell
    }
}
