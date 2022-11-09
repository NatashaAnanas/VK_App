// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let newsIDCellText = "news"
    }

    // MARK: - Private Property

    private let post = Post()
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        post.images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.newsIDCellText,
            for: indexPath
        ) as? NewsTableViewCell else { return UITableViewCell() }

        let userName = post.names[indexPath.row]
        let userImageName = post.images[indexPath.row]
        let description = post.statuses[indexPath.row]
        let date = post.date[indexPath.row]
        let imagePostName = post.images[indexPath.row]

        cell.setUpUI(
            userName: userName,
            userImageText: userImageName,
            datePost: date,
            descriptionPost: description,
            postImageText: imagePostName
        )

        return cell
    }
}
