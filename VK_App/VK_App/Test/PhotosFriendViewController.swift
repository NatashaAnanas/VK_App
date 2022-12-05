// PhotosFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import SDWebImage
import UIKit

/// Экран с фотографиями пользователя
final class PhotosFriendViewController: UIViewController {
    // MARK: - Private @IBOutlet

    @IBOutlet private var photoTableView: UITableView!

    // MARK: - Private Constants

    private enum Constants {
        static let photoTestID = "photoFriends"
        static let errorText = "Error"
    }

    // MARK: - Private Properies

    private let networkService = NetworkService()
    private let realmService = RealmService()
    private var photos: [Photo] = []
    private var sizes: [Sizes] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotoToRealm()
    }

    // MARK: - Private Methods

    private func loadPhotoToRealm() {
        do {
            let realm = try Realm()
            let image = Array(realm.objects(Sizes.self))
            if sizes != image {
                sizes = image
            } else {
                fetchPhotos()
            }
        } catch {
            showAlert(title: Constants.errorText, message: error.localizedDescription)
        }
    }

    private func fetchPhotos() {
        networkService.fetchUserPhotos { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(photo):
                self.photos = photo.response.photos
                self.realmService.saveToRealm(object: photo.response.photos[0].sizes)
                self.photoTableView.reloadData()
            case let .failure(error):
                self.showAlert(title: Constants.errorText, message: error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension PhotosFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sizes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.photoTestID,
            for: indexPath
        ) as? PhotoFriendsTableViewCell,
            let imageURL = URL(string: sizes[indexPath.row].url)
        else { return UITableViewCell() }

        DispatchQueue.main.async {
            cell.configure(imageURL: imageURL)
        }
        return cell
    }
}
