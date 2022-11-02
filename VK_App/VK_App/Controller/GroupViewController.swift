// GroupViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с группами
final class GroupViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let groupIDCellText = "group"
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.groupIDCellText, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}
