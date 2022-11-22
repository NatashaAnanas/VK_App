//
//  WKWebViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 22.11.2022.
//

import UIKit
import WebKit

/// WebKit - экран входа в вк
class WKWebViewController: UIViewController {
    
    // MARK: - Private Constant
    private enum Constants {
        static let shemeUrlComponent = "https"
        static let hostUrlComponent = "oauth.vk.com"
        static let pathUrlComponent = "/authorize"
        static let loginWebGegieIdentifier = "LoginWebSegue"
        static let accessTokenText = "access_token"
        static let tabBarID = "tabBar"
        static let equally = "="
        static let ampersant = "&"
        static let blankHtmlText = "/blank.html"
        static let clientIdIext = "client_id"
        static let displayText = "display"
        static let mobileText = "mobile"
    }
    
    // MARK: - Private Visual Components
    private let wkWebView = WKWebView()
    private let networkService = NetworkService()
    
    // MARK: - Private Properties
    private var userId = Session.instance.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createWkWebView()
        addConstraintWkWebView()
        getURl()
    }
    
    private func getURl() {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.shemeUrlComponent
        urlComponents.host = Constants.hostUrlComponent
        urlComponents.path = Constants.pathUrlComponent
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.clientIdIext, value: userId),
            URLQueryItem(name: Constants.displayText, value: Constants.mobileText),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)

        wkWebView.load(request)
    }
    
    private func createWkWebView() {
        wkWebView.navigationDelegate = self
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wkWebView)
    }
    
    private func addConstraintWkWebView() {
        NSLayoutConstraint.activate([
            wkWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wkWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wkWebView.topAnchor.constraint(equalTo: view.topAnchor),
            wkWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension WKWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard let url = navigationResponse.response.url, url.path ==
                Constants.blankHtmlText, let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: Constants.ampersant)
            .map { $0.components(separatedBy: Constants.equally) }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params[Constants.accessTokenText] {
            Session.instance.token = token
            print(token)

        }
        decisionHandler(.cancel)
        performSegue(withIdentifier: Constants.tabBarID, sender: self)
    }
}
