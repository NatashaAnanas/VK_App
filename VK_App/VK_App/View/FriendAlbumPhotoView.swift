//
//  FriendAlbumPhotoView.swift
//  VK_App
//
//  Created by Анастасия Козлова on 10.11.2022.
//

import UIKit

/// Экран альбом друга
final class FriendAlbumPhotoView: UIView {
    
    // MARK: - Private Visual Components
    private let friendImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Private Property
    private var photo: [UIImage] {
        let sortPhotoNames = photoNames.sorted { $0.0 < $1.0}
        return sortPhotoNames[photoIndex].1.map { UIImage(named: $0) ?? UIImage() }
    }
    
    private let nameText = String()
    private let user = User()
    private var photoIndex = Int()
    private var photoNames: [(String, [String])] = []
    private var index = Int()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview()
        setupConstraints()
        createSwipeGesture()
    }
    
    // MARK: - Public Metods
    func updatePhoto(friend: User, imageName: String, index: Int) {
        friendImageView.image = UIImage(named: imageName)
        photoNames = friend.images
        photoIndex = index
    }
    
    // MARK: - Private Metods
    private func addSubview() {
        addSubview(friendImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func createSwipeGesture() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        addGestureRecognizer(swipeLeft)
    }
    
    private func swipe(translationX: Int, increaseIndex: Int) {
        index += increaseIndex
        guard index < photo.count, index >= 0 else {
            index -= increaseIndex
            return
        }
        UIView.animate(
            withDuration: 0.5
        ) {
            let translation = CGAffineTransform(translationX: CGFloat(translationX), y: 0)
            self.friendImageView.transform = translation
                .concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            self.friendImageView.layer.opacity = 0.2
        } completion: { _ in
            self.friendImageView.layer.opacity = 1
            self.friendImageView.transform = .identity
            self.friendImageView.image = self.photo[self.index]
        }
    }
    
    @objc private func swipeAction(sender: UIGestureRecognizer) {
        guard let swipeGesture = sender as? UISwipeGestureRecognizer else { return }
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.left:
            swipe(translationX: -500, increaseIndex: 1)
        case UISwipeGestureRecognizer.Direction.right:
            swipe(translationX: 500, increaseIndex: -1)
        default:
            break
        }
    }
}
