//
//  FetchFriends.swift
//  VK_App
//
//  Created by Анастасия Козлова on 08.12.2022.
//

import Alamofire
import PromiseKit

/// Network service with PromiseKit
final class NetworkServicePromise {
    
    // MARK: - Private Constants
    
    private enum Constants {
            static let baseURL = "https://api.vk.com/method/"
            static let friendFields = "fields"
            static let friendFieldsValue = "nickname, photo_100"
            static let getFriends = "friends.get"
            static let filters = "filters"
            static let acessTokenParameter = "access_token"
            static let versionParameter = "v"
            static let versionValue = "5.131"
        }
    
    // MARK: - Public Methods
    
    func fetchFriends() -> Promise<[Friend]> {
        let parameters: Parameters = [
            Constants.acessTokenParameter: Session.instance.token,
            Constants.friendFields: Constants.friendFieldsValue,
            Constants.versionParameter: Constants.versionValue
        ]
        let path = "\(Constants.baseURL)\(Constants.getFriends)"
        let promise = Promise<[Friend]> { resolver in
            AF.request(path, parameters: parameters).responseData { response in
                guard let data = response.data else { return }
                do {
                    let request = try JSONDecoder().decode(FriendResult.self, from: data)
                    resolver.fulfill(request.response.friends)
                } catch {
                    resolver.reject(error)
                }
            }
        }
        return promise
    }
}
