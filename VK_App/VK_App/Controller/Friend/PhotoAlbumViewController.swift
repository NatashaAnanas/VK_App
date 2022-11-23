//
//  PhotoAlbumViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 10.11.2022.
//

import UIKit

/// Экран с фотографиями пользователя
final class PhotoAlbumViewController: UIViewController {

    // MARK: - Private IBOutlet
    @IBOutlet private var friendAlbumPhotoView: FriendAlbumPhotoView!
    
    // MARK: - Public Properies
    var imageName = String()
    var photoIndex = Int()
    
    // MARK: - Private Properies
    private let user = User()
    
    // MARK: - Private Property
    private let networkService = NetworkService()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePhoto()
        networkService.getUserPhotos()
    }
    
    private func updatePhoto() {
        friendAlbumPhotoView.updatePhoto(friend: user, imageName: imageName, index: photoIndex)
    }
}
