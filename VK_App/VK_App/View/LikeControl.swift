//
//  UILikeControl.swift
//  VK_App
//
//  Created by Анастасия Козлова on 03.11.2022.
//

import UIKit

/// Создание UIControl - отображение и кол-во лайков
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - IBInspectable
    @IBInspectable var isLiked: Bool = false {
        didSet {
            changeLikes()
        }
    }

    @IBInspectable var likesCount: Float = 0 {
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(likeButtonAction(sender: )))
        likeButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setUpButtonConstraint() {
        NSLayoutConstraint.activate([
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 20)
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
        likeButton.tintColor = .magenta
        likeButton.setImage(UIImage(systemName: Constants.heartFillButtonImageName), for: .normal)
        likesLabel.textColor = .magenta
    }

    private func removeLike() {
        likeButton.tintColor = .white
        likeButton.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        likesLabel.textColor = .white
    }

    private func changeLikeCount() {
        likesLabel.text = String(Int(likesCount))
    }

    @objc private func likeButtonAction(sender: UIButton) {
        isLiked.toggle()
    }
}
