//
//  ViewController.swift
//  ReceiveTransferDetailsAndResultsWithADelegate
//
//  Created by Kyungmin Lee on 2021/08/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    @IBOutlet var loadButton: UIButton!
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    var receivedData: Data?
    
    func handleClientError(_ error: Error?) {
        print(error.debugDescription)
    }

    @IBAction func touchUpLoadButton(_ sender: UIButton) {
        startLoad()
    }
    
    func startLoad() {
        loadButton.isEnabled = false
        let url = URL(string: "https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory")!
        receivedData = Data()
        let task = session.dataTask(with: url)
        task.resume()
    }
}

extension ViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        print(">> response")
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode),
              let mimeType = response.mimeType,
              mimeType == "text/html" else {
            completionHandler(.cancel)
            return
        }
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(">> append data")
        self.receivedData?.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(">> didCompleteWithError")
        DispatchQueue.main.async {
            self.loadButton.isEnabled = true
            if let error = error {
                self.handleClientError(error)
            } else if let receivedData = self.receivedData,
                      let string = String(data: receivedData, encoding: .utf8) {
                self.webView.loadHTMLString(string, baseURL: task.currentRequest?.url)
            }
        }
    }
}
