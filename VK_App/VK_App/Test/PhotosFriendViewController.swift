//
//  PhotosFriendViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import SDWebImage
import UIKit

/// Экран с фотографиями пользователя
final class PhotosFriendViewController: UIViewController {
    
    @IBOutlet private var photoTableView: UITableView!
    
    // MARK: - Private Constants
    private enum Constants {
        static let photoTestID = "photoFriends"
    }
    
    // MARK: - Private Properies
    private let networkService = NetworkService()
    private var apiPhotos: [Photo] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }
    
    // MARK: - Private Methods
    
    private func fetchPhotos() {
        networkService.fetchUserPhotos { [weak self] result in
            switch result {
            case .success(let photo):
                self?.apiPhotos = photo.response.photos
                self?.photoTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension PhotosFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.photoTestID,
               for: indexPath) as? PhotoFriendsTableViewCell
        else { return UITableViewCell() }
        
        guard let imageURL =  URL(string: apiPhotos[indexPath.row].sizes.first?.url ?? "")
        else { return UITableViewCell() }
        
        DispatchQueue.main.async {
            cell.configure(imageURL: imageURL)
        }
        return cell
    }
}
