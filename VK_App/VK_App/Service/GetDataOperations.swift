//
//  GetDataOperations.swift
//  VK_App
//
//  Created by Анастасия Козлова on 08.12.2022.
//

import Alamofire
import Foundation

/// GetDataOperations
final class GetDataOperations: AsyncOperation {

    // MARK: - Public Properties
    var data: Data?

    // MARK: - Private Properties
    private var request: DataRequest
    // MARK: Initializers

    init (request: DataRequest) {
        self.request = request
    }
    override func cancel() {
        request.cancel()
        super.cancel()
    }
    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.state = .finished
        }
    }
}
