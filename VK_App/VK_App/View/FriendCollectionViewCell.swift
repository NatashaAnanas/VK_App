// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка шапка профиля друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlets

    @IBOutlet private var personNameLabel: UILabel!
    @IBOutlet private var personImageView: UIImageView!
    @IBOutlet private var likesControl: LikeControl!

    // MARK: - Public methods

    func configure(personName: String, imageName: String) {
        personImageView.image = UIImage(named: imageName)
        personNameLabel.text = personName
    }
}
