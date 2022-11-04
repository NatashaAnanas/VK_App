//
//  PersonImageView.swift
//  VK_App
//
//  Created by Анастасия Козлова on 04.11.2022.
//

import UIKit

/// Настройка аватара пользователя + тень
@IBDesignable final class PersonImageView: UIView {
    
    // MARK: - Private Visual components
    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()

    // MARK: - IBInspectable
    @IBInspectable var imageName: String = "" {
        didSet {
            setImage(imageName: imageName)
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 7 {
        didSet {
            updateShadowRadius()
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.7 {
        didSet {
            updateShadowOpacity()
        }
    }

    @IBInspectable var shadowColor: UIColor = .white {
        didSet {
            updateShadowColor()
        }
    }

    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Public Methods
    func setImage(imageName: String) {
        personImageView.image = UIImage(named: imageName)
    }
    
    // MARK: - Private Methods
    private func setupView() {
        addSubview(personImageView)
        personImageView.frame = bounds
        personImageView.layer.cornerRadius = bounds.width / 2
        setupShadow()
    }

    private func setupShadow() {
        layer.cornerRadius = bounds.width / 2
        updateShadowColor()
        updateShadowOpacity()
        updateShadowRadius()
    }

    private func updateShadowRadius() {
        layer.shadowRadius = shadowRadius
    }

    private func updateShadowColor() {
        layer.shadowColor = shadowColor.cgColor
    }

    private func updateShadowOpacity() {
        layer.shadowOpacity = shadowOpacity
    }
}
