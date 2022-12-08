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
    
    // MARK: - Private Method
    
    private func fetchNews() {
        networkService.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.filterResponse(response: success.response)
                DispatchQueue.main.async {
                    self.newsFeeds = success.response.newsFeed
                    self.newsTableView.reloadData()
                }
            case .failure(let failure):
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
    
    private func formatData(timestamp: Int) -> String {
            let date = NSDate(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date as Date)
            return String(localDate)
        }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return newsFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.newsTextIDCellText,
            for: indexPath
        ) as? NewsTextTableViewCell else { return UITableViewCell() }
        
        let item = newsFeeds[indexPath.row]
        
        cell.configure(userName: item.authorName ?? "",
                       userImageText: item.avatarPath ?? "",
                       datePost: formatData(timestamp: item.date),
                       descriptionPost: item.text)
        
        return cell
    }
}
