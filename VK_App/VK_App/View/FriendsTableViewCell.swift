// FriendsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с другом
final class FriendsTableViewCell: UITableViewCell {
    // MARK: - Private Constant

    private enum Constant {
        static let fatalErrorString = "init(coder:) has not been implemented"
    }

    // MARK: - IBOutlets

    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet var friendImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var shadowView: PersonImageView!

    // MARK: - Public Methods

    func setUpUI(name: String, imageName: String, city: String) {
        friendImageView.image = UIImage(named: imageName)
        friendNameLabel.text = name
        cityLabel.text = city
        shadowView.setImage(imageName: imageName)
    }
}
