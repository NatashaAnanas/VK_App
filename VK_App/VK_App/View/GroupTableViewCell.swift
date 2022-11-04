//
//  GroupTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 02.11.2022.
//

import UIKit

/// Ячейка c группой
final class GroupTableViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var groupImageView: UIImageView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var nameGroupLabel: UILabel!
    
    // MARK: - Public methods
    func setUpUI(groupName: String, imageName: String, status: String) {
        groupImageView.image = UIImage(named: imageName)
        statusLabel.text = status
        nameGroupLabel.text = groupName
    }
}
