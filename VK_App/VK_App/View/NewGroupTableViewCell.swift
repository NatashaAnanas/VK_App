// NewGroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с новой группой
final class NewGroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlets

    @IBOutlet private var groupImageView: UIImageView!
    @IBOutlet private var nameGroupLabel: UILabel!
    @IBOutlet private var statusGroupLabel: UILabel!

    // MARK: - Public methods

    func configure(groupName: String, imageName: String, status: String) {
        groupImageView.image = UIImage(named: imageName)
        statusGroupLabel.text = status
        nameGroupLabel.text = groupName
    }
}
