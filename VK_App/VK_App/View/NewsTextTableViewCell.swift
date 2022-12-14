// NewsTextTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Ячейка с текстовым контентом в разделе новости
final class NewsTextTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlets

    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!

    // MARK: - Public Methods

    func configure(
        userName: String?,
        userImageText: String?,
        datePost: String,
        descriptionPost: String
    ) {
        guard let userImageText = userImageText,
              let userName = userName
        else { return }
        nameLabel.text = userName
        userImageView.sd_setImage(with: URL(string: userImageText))
        dateLabel.text = datePost
        contentLabel.text = descriptionPost
    }
}
