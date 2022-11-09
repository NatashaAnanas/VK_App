// PageMyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница пользователя(друга)
final class PageMyFriendViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let pageOneIDText = "page1"
        static let pageButtonIDText = "buttonCell"
    }

    // MARK: - Public Propery

    var infoUser: (String, String) = ("", "")
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension PageMyFriendViewController: UICollectionViewDelegate,
    UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constant.pageOneIDText,
                for: indexPath
            ) as? FriendCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.setUpUI(personName: infoUser.0, imageName: infoUser.1)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PageMyFriendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.bounds.width, height: 130)
    }
}
