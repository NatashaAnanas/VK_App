//
//  MyGroupViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 01.11.2022.
//

import UIKit

/// Страница с группами 2
final class MyGroupViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constant {
        static let myGroupIDCellText = "myGroup"
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.myGroupIDCellText, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}
