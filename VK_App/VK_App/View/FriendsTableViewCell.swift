// FriendsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с другом
final class FriendsTableViewCell: UITableViewCell {
    // MARK: - Private Constant

    private enum Constant {
        static let fatalErrorString = "init(coder:) has not been implemented"
    }

    // MARK: - Private IBOutlets

    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var friendImageView: UIImageView!
    @IBOutlet private var friendNameLabel: UILabel!
    @IBOutlet private var shadowView: PersonImageView!

    // MARK: - Public Methods

    func configure(name: String, imageName: String, city: String) {
        friendImageView.image = UIImage(named: imageName)
        friendNameLabel.text = name
        cityLabel.text = city
        shadowView.setImage(imageName: imageName)
    }
}
