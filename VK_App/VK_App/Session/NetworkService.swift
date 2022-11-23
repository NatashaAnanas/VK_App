// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой слой Alamofire
struct NetworkService {
    // MARK: - Private Constants

    private enum Constants {
        static let baseURL = "https://api.vk.com/method/"
        static let tokenText = "?&access_token=\(Session.instance.token)"
        static let friendFieldsText = "&fields=first_name"
        static let getFriendText = "friends.get"
        static let getUserPhotoText = "photos.getAll"
        static let getGroupsText = "groups.get"
        static let getSearchGroupRequestText = "groups.search"
        static let searchQueryText = "&q="
        static let versionText = "&v=5.81"
    }

    // MARK: - Public Methods

    func sendRequest(path: String) {
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchFriends() {
        let path =
            """
            \(Constants.getFriendText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
            """
        sendRequest(path: path)
    }

    func fetchUserPhotos() {
        let path =
            """
            \(Constants.getUserPhotoText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
            """
        sendRequest(path: path)
    }

    func fetchGroups() {
        let path = """
        \(Constants.getGroupsText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
        """
        sendRequest(path: path)
    }

    func fetchGroups(group: String) {
        
        let firstPath = "\(Constants.getSearchGroupRequestText)\(Constants.tokenText)\(Constants.friendFieldsText)"
        let secondPath = "\(Constants.searchQueryText)\(group)\(Constants.versionText)"
        let path = "\(firstPath)\(secondPath)"
        sendRequest(path: path)
    }
}
