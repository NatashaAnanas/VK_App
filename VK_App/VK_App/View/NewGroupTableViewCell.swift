//
//  NewGroupTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 02.11.2022.
//

import UIKit

/// Ячейка с новой группой
final class NewGroupTableViewCell: UITableViewCell {

    // MARK: - Private IBOutlets
    @IBOutlet private weak var groupImageView: UIImageView!
    @IBOutlet private weak var nameGroupLabel: UILabel!
    @IBOutlet private weak var statusGroupLabel: UILabel!
    
    // MARK: - Public methods
    func setUpUI(groupName: String, imageName: String, status: String) {
        groupImageView.image = UIImage(named: imageName)
        statusGroupLabel.text = status
        nameGroupLabel.text = groupName
    }
}
