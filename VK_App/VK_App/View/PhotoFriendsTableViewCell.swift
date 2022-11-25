// PhotoFriendsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Экран с фотографией друга
final class PhotoFriendsTableViewCell: UITableViewCell {
    // MARK: - Private Visual Components

    @IBOutlet private var friendImageView: UIImageView!

    // MARK: - Public Metods

    func configure(imageURL: URL) {
        friendImageView.sd_setImage(with: imageURL)
    }
}
