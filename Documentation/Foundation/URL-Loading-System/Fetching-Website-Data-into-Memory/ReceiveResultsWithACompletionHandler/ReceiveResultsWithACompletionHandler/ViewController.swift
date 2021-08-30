//
//  ViewController.swift
//  ReceiveResultsWithACompletionHandler
//
//  Created by Kyungmin Lee on 2021/08/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoad(with: "https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory")
    }
    
    @IBAction func touchUpAppleButton(_ sender: UIButton) {
        startLoad(with: "https://www.apple.com/kr/")
    }
    
    @IBAction func touchUpDeveloperButton(_ sender: UIButton) {
        startLoad(with: "https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory")
    }
    
    /// 클라이언트 에러 핸들링
    func handleClientError(_ error: Error?) {
        print(">> error: \(error.debugDescription)")
    }
    
    /// 서버 에러 핸들링
    func handleServerError(_ response: URLResponse?) {
        print(">> response: \(response.debugDescription)")
    }

    func startLoad(with url: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.handleClientError(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
               let data = data,
               let string = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.webView.loadHTMLString(string, baseURL: url)
                }
            }
        }
        task.resume()
    }
}

