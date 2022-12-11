// MyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import PromiseKit
import RealmSwift
import SDWebImage
import UIKit

/// Экран со списком друзей
final class MyFriendViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendTestID = "friendTest"
        static let errorText = "Error"
        static let emptyTitel = ""
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var friendTableView: UITableView!

    // MARK: - Private Properties

    private let realmService = RealmService()
    private let networkServicePromise = NetworkPromiseService()
    private var friendsToken: NotificationToken?
    private var friends: [Friend] = []
    private var photoCacheService: PhotoCacheService?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriendsFromRealm()
    }

    // MARK: - Private Methods

    private func loadFriendsFromRealm() {
        realmService.saveToRealm(object: friends)
        guard let users = RealmService.get(Friend.self)
        else { return }
        addUserToken(result: users)
        if friends != Array(users) {
            friends = Array(users)
            photoCacheService = PhotoCacheService(container: friendTableView)
        } else {
            fetchFriends()
        }
    }

    private func fetchFriends() {
        firstly {
            networkServicePromise.fetchFriends()
        }.done { [weak self] friends in
            self?.realmService.saveToRealm(object: friends)
        }.catch { error in
            self.showAlert(title: Constants.emptyTitel, message: error.localizedDescription)
        }
    }

    private func addUserToken(result: Results<Friend>) {
        friendsToken = result.observe { [weak self] change in
            guard let self = self else { return }
            switch change {
            case .initial:
                break
            case .update:
                self.friends = Array(result)
                self.friendTableView.reloadData()
            case let .error(error):
                self.showAlert(title: Constants.errorText, message: error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension MyFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.friendTestID,
            for: indexPath
        )
        cell.backgroundColor = .magenta
        DispatchQueue.main.async {
            cell.textLabel?
                .text = "\(self.friends[indexPath.row].firstName) \(self.friends[indexPath.row].lastName)"
            cell.imageView?.image = self.photoCacheService?.photo(
                atIndexpath: indexPath,
                byUrl: self.friends[indexPath.row].photo
            )
        }
        return cell
    }
}
