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
    @IBOutlet var albumView: FriendAlbumPhotoView!
    
    // MARK: - Private Property
    private let user = User()
    
    // MARK: - Public Property
    var imageName = String()
    var photoIndex = Int()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        albumView.updatePhoto(friend: user, imageName: "me", index: photoIndex)
    }
}
