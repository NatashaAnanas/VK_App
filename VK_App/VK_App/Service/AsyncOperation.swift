//
//  AsyncOperation.swift
//  VK_App
//
//  Created by Анастасия Козлова on 08.12.2022.
//

import Foundation

/// AsyncOperation
class AsyncOperation: Operation {
    
    private enum Constants {
        static let isText = "is"
    }
    
    enum State: String {
        case ready, executing, finished
        fileprivate var keyPath: String {
            Constants.isText + rawValue.capitalized
        }
    }

    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    override var isAsynchronous: Bool {
        true
    }

    override var isReady: Bool {
        super.isReady && state == .ready
    }

    override var isExecuting: Bool {
        state == .executing
    }

    override var isFinished: Bool {
        state == .finished
    }

    override func start() {
        if isCancelled {
            state = .finished
        } else {
            main()
            state = .executing
        }
    }

    override func cancel() {
        super.cancel()
        state = .finished
    }
}
