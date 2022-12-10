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
        static let getSearchGroupText = "groups.search"
        static let getNewsText = "newsfeed.get"
        static let searchQueryText = "&q="
        static let versionText = "&v=5.81"
        static let acessTokenParameterText = "access_token"
        static let versionParameterText = "v"
        static let versionValueText = "5.131"
        static let postText = "post"
        static let filtersText = "filters"
        static let friendsUrlText = """
        \(Constants.getFriendText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
        """
        static let groupsFirstUrlText = """
        \(Constants.getSearchGroupText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.searchQueryText)
        """
        static let photosUrlText = """
        \(Constants.getUserPhotoText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
        """
        static let newsUrlText = """
        \(Constants.getNewsText)\(Constants.tokenText)\(Constants.friendFieldsText)\(Constants.versionText)
        """
    }

    // MARK: - Public Methods

    func fetchFriends(completion: @escaping (Result<FriendResult, Error>) -> ()) {
        fetchData(urlPath: Constants.friendsUrlText, completion: completion)
    }

    func fetchUserPhotos(completion: @escaping (Result<PhotoResult, Error>) -> ()) {
        fetchData(urlPath: Constants.photosUrlText, completion: completion)
    }

    func fetchGroups(group: String, completion: @escaping (Result<GroupResult, Error>) -> ()) {
        let path = "\(Constants.groupsFirstUrlText)\(group)\(Constants.versionText)"
        fetchData(urlPath: path, completion: completion)
    }

    func fetchNews(completion: @escaping (Result<NewsResult, Error>) -> ()) {
        let parameters: Parameters = [
            Constants.acessTokenParameterText: Session.instance.token,
            Constants.filtersText: Constants.postText,
            Constants.versionParameterText: Constants.versionValueText
        ]
        let path = "\(Constants.baseURL)\(Constants.getNewsText)"

        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.data else { return }
            do {
                let request = try JSONDecoder().decode(NewsResult.self, from: data)
                completion(.success(request))

            } catch {
                completion(.failure(error))
            }
        }
    }

    func getGroups() {
        let opq = OperationQueue()
        let request = getRequest()
        let getDataOperation = GetDataOperations(request: request)
        opq.addOperation(getDataOperation)

        let parseData = ParseGroupData()
        parseData.addDependency(getDataOperation)
        opq.addOperation(parseData)

        let saveToRealm = ReloadTable()
        saveToRealm.addDependency(parseData)
        OperationQueue.main.addOperation(saveToRealm)
    }

    // MARK: - Private Methods

    private func fetchData<T: Decodable>(urlPath: String, completion: @escaping (Result<T, Error>) -> ()) {
        let url = "\(Constants.baseURL)\(urlPath)"
        AF.request(url).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }

    private func getRequest() -> DataRequest {
        let baseURL = "https://api.vk.com/method/"
        let version = "5.131"
        let token = Session.instance.token
        let path = "groups.get"
        let parameters: Parameters = [
            "v": version,
            "extended": "1",
            "access_token": token
        ]
        let url = (baseURL + path)
        let request = AF.request(url, parameters: parameters)
        return request
    }
}