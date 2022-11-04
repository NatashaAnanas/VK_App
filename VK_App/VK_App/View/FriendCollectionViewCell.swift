// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка шапка профиля друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var personNameLabel: UILabel!
    @IBOutlet private var personImageView: UIImageView!
    @IBOutlet private var likesControl: LikeControl!
    
    // MARK: - Public methods

    func setUpUI(personName: String, imageName: UIImage) {
        personImageView.image = imageName
        personNameLabel.text = personName
    }
}
