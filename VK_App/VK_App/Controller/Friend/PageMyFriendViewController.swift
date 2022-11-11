// PageMyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран пользователя(друга)
final class PageMyFriendViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let pageOneIDText = "pageOne"
        static let pageButtonIDText = "buttonCell"
        static let segueIDText  = "segue"
    }

    // MARK: - Public Properies

    var infoUser: (String, String) = ("", "")
    var photoIndex = Int()

    // MARK: - Public Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == Constant.segueIDText,
              let destination = segue.destination as? PhotoAlbumViewController
        else { return }
        
        destination.photoIndex = photoIndex
        destination.modalTransitionStyle = .crossDissolve
    }
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

        cell.configure(personName: infoUser.0, imageName: infoUser.1)
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
