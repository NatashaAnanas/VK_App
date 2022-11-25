//
//  PhotoTestTableViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import SDWebImage
import UIKit

/// Экран с фотографией друга
final class PhotoTestTableViewCell: UITableViewCell {

    @IBOutlet private var friendImageView: UIImageView!
    
    func configure(imageURL: URL) {
        friendImageView.sd_setImage(with: imageURL)
    }
}
