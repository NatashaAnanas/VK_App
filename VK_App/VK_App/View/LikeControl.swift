// LikeControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контрол лайков
@IBDesignable final class LikeControl: UIControl {
    // MARK: - Private constants

    private enum Constants {
        static let heartButtonImageName = "heart"
        static let heartFillButtonImageName = "heart.fill"
        static let zeroText = "0"
    }

    // MARK: - Private Visual components

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.zeroText
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(
            font: UIFont(descriptor: UIFontDescriptor(), size: 40)
        ), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Property

    @IBInspectable private var isLiked: Bool = false {
        didSet {
            changeLikes()
        }
    }

    @IBInspectable private var likesCount: Float = 0 {
        didSet {
            changeLikeCount()
        }
    }

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Private methods

    private func setupView() {
        addSubview(likeButton)
        addSubview(likesLabel)
        createGestureRecognizer()
        setUpButtonConstraint()
        setUpLabelConstraint()
    }

    private func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(likeButtonAction(sender:))
        )
        likeButton.addGestureRecognizer(tapGestureRecognizer)
        likeButton.isUserInteractionEnabled = true
    }

    private func setUpButtonConstraint() {
        NSLayoutConstraint.activate([
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            likeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setUpLabelConstraint() {
        NSLayoutConstraint.activate([
            likesLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 5),
            likesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            likesLabel.widthAnchor.constraint(equalTo: likeButton.widthAnchor),
            likesLabel.heightAnchor.constraint(equalTo: likeButton.widthAnchor)
        ])
    }

    private func changeLikes() {
        if isLiked {
            addLike()
            likesCount += 1
        } else {
            removeLike()
            likesCount -= 1
        }
    }

    private func addLike() {
        likeButton.tintColor = .red
        likeButton.setImage(UIImage(systemName: Constants.heartFillButtonImageName), for: .normal)
        likesLabel.textColor = .red
    }

    private func removeLike() {
        likeButton.tintColor = .white
        likeButton.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        likesLabel.textColor = .white
    }

    private func changeLikeCount() {
        likesLabel.text = String(Int(likesCount))
    }

    private func likeTabAction() {
        likeButton.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        UIView.animate(
            withDuration: 1.5,
            delay: 0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.5,
            options: .curveEaseInOut,
            animations: {
                self.likeButton.transform = .identity
            }
        )
    }

    @objc private func likeButtonAction(sender: UIButton) {
        isLiked.toggle()
        likeTabAction()
    }
}
