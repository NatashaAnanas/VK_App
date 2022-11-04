//
//  FriendsTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 02.11.2022.
//

import UIKit

/// Ячейка с другом
final class FriendsTableViewCell: UITableViewCell {
    
    // MARK: - Private Constant
    private enum Constant {
        static let fatalErrorString = "init(coder:) has not been implemented"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var shadowView: PersonImageView!
    
    // MARK: - Public Methods
    func setUpUI(name: String, imageName: String, city: String) {
        friendImageView.image = UIImage(named: imageName)
        friendNameLabel.text = name
        cityLabel.text = city
        shadowView.setImage(imageName: imageName)
    }
}
