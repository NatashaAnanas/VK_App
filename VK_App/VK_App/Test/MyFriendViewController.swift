//
//  FriendTestViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 24.11.2022.
//

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
    private var apiFriends: [Friend] = []

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFriends()
    }
    
    // MARK: - Private Methods
    
    private func fetchFriends() {
        networkService.fetchFriends { [weak self] result in
            switch result {
            case .success(let friend):
                self?.apiFriends = friend.response.friends
                self?.friendTableView.reloadData()
            case .failure(let error):
               print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension MyFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.friendTestID,
                                                 for: indexPath)
        DispatchQueue.main.async {
        cell.textLabel?.text = "\(self.apiFriends[indexPath.row].firstName) \(self.apiFriends[indexPath.row].lastName)"
        }
        return cell
    }
}
