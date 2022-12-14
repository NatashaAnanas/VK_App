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

    // MARK: - Private Visual Components

    private let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        return refresh
    }()

    // MARK: - Private Properties

    private let post = Post()
    private let networkService = NetworkService()
    private var newsFeeds: [NewsFeed] = []

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRefreshControl()
        fetchNews()
        setupTableView()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        newsTableView.prefetchDataSource = self
    }

    private func setUpRefreshControl() {
        newsTableView.addSubview(refreshControl)
        refreshControl.addTarget(
            self,
            action: #selector(refreshControlAction(sender:)),
            for: .valueChanged
        )
    }

    private func fetchNews() {
        networkService.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(success):
                self.filterResponse(response: success.response)
                DispatchQueue.main.async {
                    self.newsFeeds = success.response.newsFeed + self.newsFeeds
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

    @objc private func refreshControlAction(sender: UIRefreshControl) {
        refreshControl.beginRefreshing()
        fetchNews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.refreshControl.endRefreshing()
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
            withIdentifier: Constants.newsIDCellText,
            for: indexPath
        ) as? NewsTableViewCell else { return UITableViewCell() }

        let news = newsFeeds[indexPath.row]

        cell.configure(
            userNameText: news.authorName ?? Constants.emptyText,
            userImageText: news.avatarPath ?? Constants.emptyText,
            dateText: convert(timeStamp: Int(news.date)),
            descriptionText: news.text,
            postImageText: news.attachments?.first?.photo?.sizes.first?.url
                ?? Constants.emptyText,
            likes: String(news.likes.count)
        )
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let newsFeeds = newsFeeds[indexPath.row]
        guard
            let height = newsFeeds.attachments?.first?.photo?.sizes.first?.height,
            let width = newsFeeds.attachments?.first?.photo?.sizes.first?.width
        else { return CGFloat() }
        let tableWidth = tableView.bounds.width
        let aspectRatio = CGFloat(height) / CGFloat(width)
        let cellHeight = tableWidth * aspectRatio
        return cellHeight
    }
}

// MARK: - UITableViewDataSourcePrefetching

extension NewsViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxSection = indexPaths.map(\.row).max() else { return }
        if maxSection > newsFeeds.count - 20 {
            newsTableView.reloadData()
            fetchNews()
        }
    }
}
