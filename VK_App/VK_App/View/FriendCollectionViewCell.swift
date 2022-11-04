// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка шапка профиля друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet

    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var personImageView: UIImageView!
    @IBOutlet private var likesControl: LikeControl!
}
