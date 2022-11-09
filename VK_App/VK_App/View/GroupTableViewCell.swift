// GroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка c группой
final class GroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlets

    @IBOutlet private var groupImageView: UIImageView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var nameGroupLabel: UILabel!

    // MARK: - Public methods

    func configure(groupName: String, imageName: String, status: String) {
        groupImageView.image = UIImage(named: imageName)
        statusLabel.text = status
        nameGroupLabel.text = groupName
    }
}
