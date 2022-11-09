// FriendsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

typealias Info = [Character: [(String, String)]]
/// Страница с друзьями
final class FriendsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendIDCellText = "friend"
        static let birthdayIDCellText = "day"
        static let myFriendIDCellText = "myfriend"
        static let birthdayText = "Дни рождения"
        static let friendText = "Мои друзья"
        static let friendSegueText = "friendSegue"
        static let storyboardText = "Main"
        static let emptyString = ""
        static let cellTypes: [CellTypes] = [.addFriend, .birthday, .alfa]
    }

    private enum CellTypes {
        case addFriend
        case birthday
        case alfa
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var friendTableView: UITableView!

    @IBOutlet weak var friendSearchBar: UISearchBar!
    // MARK: - Private Property

    private var sections: Info = [:]
    private var filteredFriendsList: Info = [:]
    private var sectionTitels: [Character] = []
    private let user = User()
    private var numberOfImage = Int()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createNameSection()
        setUpSearchBarDelegate()
    }

    // MARK: - Private Methods

    private func setUpSearchBarDelegate() {
        friendSearchBar.delegate = self
    }
    
    private func createNameSection() {
        for (index, name) in user.names.enumerated() {
            guard let first = name.first else { return }
                    let imageName = user.images[index]
            
            if sections[first] != nil {
                sections[first]?.append((name, imageName))
            } else {
                sections[first] = [(name, imageName)]
            }
        }
        filteredFriendsList = sections
        createSectionTitels()
    }
    
    private func createSectionTitels() {
        sectionTitels = Array(sections.keys)
        sectionTitels.sort()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        filteredFriendsList.count + 2
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return filteredFriendsList[sectionTitels[section - 2]]?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.friendIDCellText,
                for: indexPath
            )
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.birthdayIDCellText,
                for: indexPath
            )
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.myFriendIDCellText,
                for: indexPath
            ) as? FriendsTableViewCell else { return UITableViewCell() }

            guard let info = filteredFriendsList[sectionTitels[indexPath.section - 2]]?[indexPath.row]
            else { return UITableViewCell() }

            let city = user.cities[indexPath.row]
            cell.setUpUI(name: info.0, imageName: info.1, city: city)

            return cell
        }
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return Constants.birthdayText
        default:
            return String(sectionTitels[section - 2])
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pageFriedVC = UIStoryboard(
            name: Constants.storyboardText,
            bundle: nil
        ).instantiateViewController(withIdentifier: Constants.friendSegueText)
            as? PageMyFriendViewController else { return }
        switch indexPath.section {
        case 0, 1:
            break
        default:
            guard let name = filteredFriendsList[sectionTitels[indexPath.section - 2]]?[indexPath.row] else { return }
            pageFriedVC.infoUser.0 = name.0
            pageFriedVC.infoUser.1 = name.1

            pageFriedVC.modalPresentationStyle = .formSheet
            pageFriedVC.modalTransitionStyle = .flipHorizontal

            present(pageFriedVC, animated: true)
        }
    }
}

// MARK: - UISearchBarDelegate

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFriendsList = [:]
        
        guard
            !searchText.isEmpty
        else {
            filteredFriendsList = sections
            return
        }
        for friends in sections {
            for newName in friends.value {
                let firstChar = friends.key
                if newName.0.lowercased().contains(searchText.lowercased()) {
                    if filteredFriendsList[firstChar] != nil {
                        filteredFriendsList[firstChar]?.append(newName)
                    } else {
                        filteredFriendsList[firstChar] = [newName]
                    }
                }
            }
        }
        sectionTitels = Array(filteredFriendsList.keys)
        sectionTitels.sort()
        friendTableView.reloadData()
    }
}
