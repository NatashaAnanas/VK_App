// NewsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фото - контентом в разделе новости
final class NewsTableViewCell: UITableViewCell {
    // MARK: - Private constants

    private enum Constants {
        static let heartButtonImageName = "heart"
        static let heartFillButtonImageName = "heart.fill"
        static let zeroText = "0"
        static let oneText = "1"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var postUserImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var datePostLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var postImageView: UIImageView!
    @IBOutlet private var likeButton: UIButton!

    // MARK: - Private Property

    private var isLiked: Bool = true

    // MARK: - Public Methods

    func configure(
        userName: String,
        userImageText: String,
        datePost: String,
        descriptionPost: String,
        postImageText: String
    ) {
        userNameLabel.text = userName
        postUserImageView.image = UIImage(named: userImageText)
        datePostLabel.text = datePost
        descriptionLabel.text = descriptionPost
        postImageView.image = UIImage(named: postImageText)
        createTapGestureRecognizer()
    }

    // MARK: - Private Methods

    private func createTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(photoTabAction)
        )
        postImageView.addGestureRecognizer(tapGestureRecognizer)
        postImageView.isUserInteractionEnabled = true

        setUpAction()
    }

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

    @objc private func photoTabAction() {
        transformUI(UI: postImageView, duration: 1.5)
    }

    @objc private func likeButtonAction(sender: UIButton) {
        changeLikes()
        transformUI(UI: sender, duration: 1)
    }
}
