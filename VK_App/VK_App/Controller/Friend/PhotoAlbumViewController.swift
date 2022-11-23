// PhotoAlbumViewController.swift
// Copyright © RoadMap. All rights reserved.

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
        fetchPhotos()
    }
    
    // MARK: - Private Methods
    
    private func fetchPhotos() {
        networkService.fetchUserPhotos()
    }

    private func updatePhoto() {
        friendAlbumPhotoView.updatePhoto(friend: user, imageName: imageName, index: photoIndex)
    }
}
