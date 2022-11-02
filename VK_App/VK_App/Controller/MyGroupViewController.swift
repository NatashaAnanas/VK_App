// MyGroupViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница с группами 2
final class MyGroupViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let myGroupIDCellText = "myGroup"
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.myGroupIDCellText, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}
