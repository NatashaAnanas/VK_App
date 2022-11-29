// MyFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import SDWebImage
import UIKit

/// Экран со списком друзей
final class MyFriendViewController: UIViewController {
    // MARK: - Private Constants
    
    private enum Constants {
        static let friendTestID = "friendTest"
        static let errorText = "Error"
    }
    
    // MARK: - Private IBOutlet
    
    @IBOutlet private var friendTableView: UITableView!
    
    // MARK: - Private Properies
    
    private let networkService = NetworkService()
    private let realmService = RealmService()
    private var friendsToken: NotificationToken?
    private var friends: [Friend] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriendsFromRealm()
    }
    
    // MARK: - Private Methods
    
    private func loadFriendsFromRealm() {
        do {
            let realm = try Realm()
            let users = realm.objects(Friend.self)
            addUserToken(result: users)
            if friends != Array(users) {
                friends = Array(users)
            } else {
                fetchFriends()
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchFriends() {
        networkService.fetchFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(friend):
                self.realmService.saveToRealm(object: friend.response.friends)
            case let .failure(error):
                self.presentAlert(title: Constants.errorText, message: error.localizedDescription)
            }
        }
    }
    
    private func addUserToken(result: Results<Friend>) {
        friendsToken = result.observe { change in
            switch change {
            case .initial:
                break
            case .update:
                self.friends = Array(result)
                self.friendTableView.reloadData()
            case .error(let error):
                self.presentAlert(title: Constants.errorText, message: error.localizedDescription)
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
