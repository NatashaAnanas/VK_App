//
//  GroupViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 01.11.2022.
//

import UIKit

/// Страница с группами
final class GroupViewController: UIViewController {

    // MARK: - Private Constant
    private enum Constant {
        static let groupIDCellText = "group"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Подписываемся на делегаты UITableViewDelegate, UITableViewDataSource
extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.groupIDCellText, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}
