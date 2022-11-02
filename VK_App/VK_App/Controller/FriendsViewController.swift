// FriendsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница с друзьями
final class FriendsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let friendIDCellText = "friend"
        static let birthdayIDCellText = "day"
        static let myFriendIDCellText = "myfriend"
        static let birthdayText = "Дни рождения"
        static let friendText = "Мои друзья"
        static let cellTypes: [CellTypes] = [.addFriend, .birthday, .myFriends]
    }

    private enum CellTypes {
        case addFriend
        case birthday
        case myFriends
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        Constant.cellTypes.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Constant.cellTypes[section] {
        case .addFriend:
            return 1
        case .birthday:
            return 1
        case .myFriends:
            return 10
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Constant.cellTypes[indexPath.section] {
        case .addFriend:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.friendIDCellText,
                for: indexPath
            )
            return cell
        case .birthday:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.birthdayIDCellText,
                for: indexPath
            )
            return cell
        case .myFriends:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.myFriendIDCellText,
                for: indexPath
            )
            return cell
        }
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return Constant.birthdayText
        case 2:
            return Constant.friendText
        default:
            return nil
        }
    }
}
