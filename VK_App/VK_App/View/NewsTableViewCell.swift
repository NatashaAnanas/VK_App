// NewsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Ячейка с фото - контентом в разделе новости
final class NewsTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var postUserImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var datePostLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var postImageView: UIImageView!
    @IBOutlet private var likeButton: UIButton!

    // MARK: - Public Methods

    func configure(
        userNameText: String,
        userImageText: String,
        dateText: String,
        descriptionText: String,
        postImageText: String,
        likes: String
    ) {
        likeButton.setTitle(likes, for: .normal)
        userNameLabel.text = userNameText
        postUserImageView.sd_setImage(with: URL(string: userImageText))
        datePostLabel.text = dateText
        descriptionLabel.text = descriptionText
        postImageView.sd_setImage(with: URL(string: postImageText))
    }
}
