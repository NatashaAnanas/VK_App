// GroupViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с группами
final class GroupViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let itAnanasGroupText = "ananas"
        static let groupIDCellText = "group"
        static let allGroupText = "Все группы"
        static let addGroupNameText = "Введите название группы"
        static let changeNameText = "Название можно будет изменить в настройках"
        static let emptyString = ""
        static let iconName = "иконка"
    }

    // MARK: - Private @IBOutlet

    @IBOutlet private var groupTableView: UITableView!

    // MARK: - Private Property

    private let networkService = NetworkService()
    private var group = Group()

    private var groups: [Groups] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGroups()
    }

    // MARK: - Private Methods

    private func fetchGroups() {
        networkService.fetchGroups(group: Constants.itAnanasGroupText) { [weak self] result in
            switch result {
            case let .success(groups):
                self?.groups = groups.response.group
                DispatchQueue.main.async {
                    self?.groupTableView.reloadData()
                }
            case let .failure(error):
                error.localizedDescription
            }
        }
    }

    // MARK: - Private @IBAction

    @IBAction private func addGroupAction(_ sender: Any) {
        showAlert(
            title: Constants.addGroupNameText,
            message: Constants.allGroupText
        ) { groupName in
            guard let groupText = groupName else { return }
            self.group.names.insert(groupText, at: self.group.names.count)
            self.group.imageNames.insert(Constants.iconName, at: self.group.imageNames.count)
            self.group.statuses.insert(Constants.emptyString, at: self.group.statuses.count)
            self.groupTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension GroupViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.groupIDCellText,
            for: indexPath
        ) as? GroupTableViewCell else { return UITableViewCell() }

        cell.selectionStyle = .none
        let groupName = groups[indexPath.row].nameGroup
        guard let imageURL = URL(string: groups[indexPath.row].urlPhoto)
        else { return UITableViewCell() }
        cell.configure(groupName: groupName, imageURL: imageURL)
        return cell
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constants.allGroupText
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        guard editingStyle == .delete else { return }
        group.imageNames.remove(at: indexPath.row)
        group.names.remove(at: indexPath.row)
        group.statuses.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
