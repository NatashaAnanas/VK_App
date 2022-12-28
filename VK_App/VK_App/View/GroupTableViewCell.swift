// GroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Ячейка c группой
final class GroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlets

    @IBOutlet private var groupImageView: UIImageView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var nameGroupLabel: UILabel!

    // MARK: - Public methods

    func configure(groupName: String, imageURL: URL) {
        groupImageView.sd_setImage(with: imageURL)
        nameGroupLabel.text = groupName
    }
}
