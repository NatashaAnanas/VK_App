//
//  NewsTextTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 05.12.2022.
//

import SDWebImage
import UIKit

/// Ячейка с текстовым контентом в разделе новости
class NewsTextTableViewCell: UITableViewCell {
    
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

    // MARK: - Private Methods

    private func setUpAction() {
        likeButton.addTarget(
            self,
            action: #selector(likeButtonAction(sender:)),
            for: .touchUpInside
        )
    }

    private func changeLikes() {
        guard isLiked else {
            removeLike()
            return
        }
        addLike()
    }

    private func addLike() {
        likeButton.tintColor = .red
        likeButton.setImage(UIImage(systemName: Constants.heartFillButtonImageName), for: .normal)
        likeButton.setTitle(Constants.oneText, for: .normal)
        isLiked.toggle()
    }

    private func removeLike() {
        likeButton.tintColor = .lightGray
        likeButton.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        likeButton.setTitle(Constants.zeroText, for: .normal)
        isLiked.toggle()
    }

    private func transformUI(UI: UIView, duration: Float) {
        UI.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.5,
            options: .curveEaseInOut,
            animations: {
                UI.transform = .identity
            }
        )
    }

    @objc private func likeButtonAction(sender: UIButton) {
        changeLikes()
        transformUI(UI: sender, duration: 1)
    }
}
