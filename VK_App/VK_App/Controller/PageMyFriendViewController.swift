// PageMyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница пользователя(друга)
final class PageMyFriendViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let pageOneIDText = "page1"
        static let pageButtonIDText = "buttonCell"
        static let cellTypes: [CellTypes] = [.name, .buttons]
    }

    private enum CellTypes {
        case name
        case buttons
    }

    var fiendNameText = String()
    var friendImageView = UIImageView()
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension PageMyFriendViewController: UICollectionViewDelegate,
    UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
    Constant.cellTypes.count
}

func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch Constant.cellTypes[section] {
    case .name:
        return 1
    case .buttons:
        return 4
    }
}

func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
) -> UICollectionViewCell {
    switch Constant.cellTypes[indexPath.section] {
    case .name:
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.pageOneIDText,
            for: indexPath
        ) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        cell.personNameLabel.text = fiendNameText
        cell.personImageView.image = friendImageView.image
        return cell
    case .buttons:
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.pageButtonIDText,
            for: indexPath
        )
        return cell
    }
}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PageMyFriendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch Constant.cellTypes[indexPath.section] {
        case .name:
            return CGSize(width: view.bounds.width, height: 130)
        case .buttons:
            return CGSize(width: 80, height: 70)
        }
    }
}
