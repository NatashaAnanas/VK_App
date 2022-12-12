// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let newsIDCellText = "news"
        static let newsTextIDCellText = "newsText"
        static let emptyText = ""
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var newsTableView: UITableView!

    // MARK: - Private Properties

    private let post = Post()
    private let networkService = NetworkService()
    private var newsFeeds: [NewsFeed] = []

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    // MARK: - Private Methods

    private func fetchNews() {
        networkService.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(success):
                self.filterResponse(response: success.response)
                DispatchQueue.main.async {
                    self.newsFeeds = success.response.newsFeed
                    self.newsTableView.reloadData()
                }
            case let .failure(failure):
                print(failure.localizedDescription)
            }
        }
    }

    private func filterResponse(response: NewsResponse) {
        response.newsFeed.forEach { item in
            if item.sourceID < 0 {
                guard let group = response.groups.filter({ group in
                    group.id == item.sourceID * -1
                }).first else { return }
                item.authorName = group.groupName
                item.avatarPath = group.urlPhoto

            } else {
                guard let user = response.friends.filter({ user in
                    user.id == item.sourceID
                }).first else { return }
                item.authorName = "\(user.firstName) \(user.lastName)"
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        newsFeeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.newsTextIDCellText,
            for: indexPath
        ) as? NewsTextTableViewCell else { return UITableViewCell() }

        cell.configure(
            userName: newsFeeds[indexPath.row].authorName,
            userImageText: newsFeeds[indexPath.row].avatarPath,
            datePost: convert(timeStamp: newsFeeds[indexPath.row].date),
            descriptionPost: newsFeeds[indexPath.row].text
        )
        return cell
    }
}
