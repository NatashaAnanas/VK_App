// NewGroupViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с новыми группами
final class NewGroupViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let myGroupIDCellText = "myGroup"
        static let recGroupText = "Рекомендации"
    }

    // MARK: - Private Property

    private let newGroup = NewGroup()
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        newGroup.names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.myGroupIDCellText,
            for: indexPath
        ) as? NewGroupTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none

        let groupName = newGroup.names[indexPath.row]
        let imageName = newGroup.imageNames[indexPath.row]
        let status = newGroup.statuses[indexPath.row]
        cell.configure(groupName: groupName, imageName: imageName, status: status)

        return cell
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constant.recGroupText
    }
}
