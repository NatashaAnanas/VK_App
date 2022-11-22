//
//  ssenssion.swift
//  VK_App
//
//  Created by Анастасия Козлова on 22.11.2022.
//

import Alamofire
import Foundation

/// Сетевой слой Alamofire
struct NetworkService {
    // MARK: - Private Constants
    private enum Constants {
        static let baseURL = "https://api.vk.com/method/"
        static let acessTokenText = "?&access_token=\(Session.instance.token)"
        static let friendFieldsText = "&fields=first_name"
        static let getFriendRequestText = "friends.get"
        static let getUserPhotoRequestText = "photos.getAll"
        static let getGroupsRequestText = "groups.get"
        static let getSearchGroupRequestText = "groups.search"
        static let searchQueryText = "&q="
        static let versionText = "&v=5.81"
    }
    
    // MARK: - Public Methods
    func getInfo(path: String) {
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
    
    func getFriends() {
        let path =
        """
        \(Constants.getFriendRequestText)\(Constants.acessTokenText)
        \(Constants.friendFieldsText)\(Constants.versionText)
        """
        getInfo(path: path)
    }
    
    func getUserPhotos() {
        let path =
        """
        \(Constants.getUserPhotoRequestText)\(Constants.acessTokenText)
        \(Constants.friendFieldsText)\(Constants.versionText)
        """
        getInfo(path: path)
    }
    
    func getGroups() {
        let path = """
        \(Constants.getGroupsRequestText)\(Constants.acessTokenText)
        \(Constants.friendFieldsText)\(Constants.versionText)
        """
        getInfo(path: path)
    }
    
    func getGroups(group: String) {
        let path =
        """
        \(Constants.getSearchGroupRequestText)\(Constants.acessTokenText)
        \(Constants.friendFieldsText)
        \(Constants.searchQueryText)\(group)\(Constants.versionText)
        """
        getInfo(path: path)
    }
}
