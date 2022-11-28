// MyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import SDWebImage
import UIKit

/// Экран со списком друзей
final class MyFriendViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendTestID = "friendTest"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var friendTableView: UITableView!

    // MARK: - Private Properies

    private let networkService = NetworkService()
    private var friends: [Friend] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFriends()
    }

    // MARK: - Private Methods

    private func fetchFriends() {
        networkService.fetchFriends { [weak self] result in
            switch result {
            case let .success(friend):
                self?.friends = friend.response.friends
                self?.friendTableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
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
        DispatchQueue.main.async {
            cell.textLabel?
                .text = "\(self.friends[indexPath.row].firstName) \(self.friends[indexPath.row].lastName)"
        }
        return cell
    }
}
