//
//  FriendCollectionViewCell.swift
//  VK_App
//
//  Created by Анастасия Козлова on 03.11.2022.
//

import UIKit

/// Ячейка шапка профиля друга
final class FriendCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet private weak var likesControl: LikeControl!
}
