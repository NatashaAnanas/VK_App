//
//  NewsTextTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 05.12.2022.
//

import SDWebImage
import UIKit

/// Ячейка с текстовым контентом в разделе новости
final class NewsTextTableViewCell: UITableViewCell {
    
    // MARK: - Private constants

    private enum Constants {
        static let heartButtonImageName = "heart"
        static let heartFillButtonImageName = "heart.fill"
        static let zeroText = "0"
        static let oneText = "1"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    
    // MARK: - Private Property

    private var isLiked: Bool = true

    // MARK: - Public Methods

    func configure(
        userName: String,
        userImageText: String,
        datePost: String,
        descriptionPost: String
    ) {
        nameLabel.text = userName
        userImageView.sd_setImage(with: URL(string: userImageText))
        dateLabel.text = datePost
        contentLabel.text = descriptionPost
    }
}
