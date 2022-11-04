// GroupViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с группами
final class GroupViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let groupIDCellText = "group"
        static let allGroupText = "Все группы"
        static let addGroupNameText = "Введите название группы"
        static let changeNameText = "Название можно будет изменить в настройках"
        static let emptyString = ""
        static let iconName = "иконка"
    }

    // MARK: - @IBOutlet

    @IBOutlet private var groupTableView: UITableView!

    // MARK: - Private Property

    private var group = Group()

    // MARK: - Private @IBAction

    @IBAction private func addGroupAction(_ sender: Any) {
        showAlert(
            title: Constant.addGroupNameText,
            message: Constant.allGroupText
        ) { groupName in
            guard let groupText = groupName else { return }
            self.group.names.insert(groupText, at: self.group.names.count)
            self.group.images.insert(Constant.iconName, at: self.group.images.count)
            self.group.statuses.insert(Constant.emptyString, at: self.group.statuses.count)
            self.groupTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        group.names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.groupIDCellText,
            for: indexPath
        ) as? GroupTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        let groupName = group.names[indexPath.row]
        let imageName = group.images[indexPath.row]
        let status = group.statuses[indexPath.row]
        cell.setUpUI(groupName: groupName, imageName: imageName, status: status)
        return cell
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constant.allGroupText
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        guard editingStyle == .delete else { return }
        group.images.remove(at: indexPath.row)
        group.names.remove(at: indexPath.row)
        group.statuses.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
