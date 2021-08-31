# [공식문서로 iOS 배우기] Fetching Website Data into Memory

- [GitHub Repository](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)
- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > Foundation > URL Loading System > [Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 Receive Results with a Completion Handler 샘플 프로젝트](#-receive-results-with-a-completion-handler-샘플-프로젝트)
- [📌 Receive Transfer Details and Results with a Delegate 샘플 프로젝트](#-receive-transfer-details-and-results-with-a-delegate-샘플-프로젝트)

<br/><br/><br/>



# Fetching Website Data into Memory

URL session에서 data task를 생성하여 데이터를 메모리에 직접 수신합니다.

## Overview

원격 서버와 작은 상호 작용의 경우 `URLSessionDataTask` 클래스를 사용하여 응답 데이터를 메모리에 수신할 수 있습니다(데이터를 파일 시스템에 직접 저장하는 `URLSessionDownloadTask` 클래스를 사용하는 것과는 다르게). data task는 웹 서비스 endpoint를 호출하는 것 같은 용도에 이상적입니다.  
  
URL session 인스턴스를 사용하여 task를 생성합니다. 요구 사항이 매우 간단하다면 `URLSession`의 `shared` 인스턴스를 사용할 수 있습니다. delegate 콜백을 통해 상호작용하려면 shared 인스턴스를 사용하는 대신에 session을 생성해야 합니다. session을 생성할 때 `URLSessionConfiguration`을 사용하고 `URLSessionDelegate` 또는 그 하위 프로토콜 중 하나를 정의하는 클래스에서 전달합니다. session은 다수의 task를 생성하는 데 사용될 수 있으므로 고유한 configuration이 필요하다면 session을 생성하고 프로퍼티로 저장합니다.

> **Note**  
> 필요 이상으로 session을 생성하지 않도록 주의하세요. 예를 들어 앱의 여러 부분에서 유사한 구성의 session이 필요하다면 하나의 session을 생성하고 이것을 공유하세요.

session이 있으면 `dataTask()` 메서드 중 하나로 data task를 생성합니다. task는 suspended 상태로 생성되고 `resume()`을 호출하는 것으로 시작됩니다.



## Receive Results with a Completion Handler

데이터를 가져오는 가장 간단한 방법은 completion handler를 사용하는 data task를 만드는 것입니다. 이 방식으로 task는 서버의 응답, 데이터, 가능한 에러를 당신이 제공하는 completion handler 블록으로 전달합니다. `Figure 1`은 session과 task간이 관계와 어떻게 결과가 completion handler로 전달되는지 보여줍니다.  
  
**Figure 1** Creating a completion handler to receive results from a task

![](https://docs-assets.developer.apple.com/published/c7124fb5d7/bf4501ff-82b2-4dd4-9ec3-243ef0e70d21.png)

completion hanlder를 사용하는 data task를 생성하려면 `URLSession`의 `dataTask(with:)` 메서드를 호출합니다. completion handler는 세가지 작업을 해야합니다.

1. `error` 파라미터가 `nil`인지 확인합니다. 아니라면 전송 에러가 발생한 것입니다. 에러를 처리하고 종료합니다.
2. `response` 파라미터를 확인하여 statue code가 성공을 나타내는지 확인하고 MIME 타입이 예상 값인지 확인합니다. 아니라면 서버 에러를 처리하고 종료합니다.
3. 필요에 따라 `data` 인스턴스를 사용합니다.

`Listing 1`은 URL의 컨텐츠를 가져오는 `startLoad()` 메서드를 보여줍니다. `URLSession` 클래스의 `shared` 인스턴스를 사용하여 결과를 completion handler에 전달하는 data task를 생성하는 것으로 시작합니다. 로컬 에러와 서버에러를 확인한 후 이 handler는 data를 string으로 변환하고 이를 사용하여 WKWebView outlet을 채웁니다. 물론 가져온 데이터를 데이터 모델로 parsing하는 것과 같이 다른 용도로 사용할 수 있습니다.  
  
**Listing 1** Creating a completion handler to receive data-loading results

~~~swift
func startLoad() {
    let url = URL(string: "https://www.example.com/")!
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
~~~

> **Important**  
> completion handler는 task가 생성된 것과 다른 Grand Central Dispatch queue에서 호출됩니다. 그러므로 webview를 업데이트하는 것과 같이 UI를 업데이트하기 위해 data나 error를 사용하는 모든 작업은 여기서 보여준 것 처럼 명시적으로 main queue에 위치해야 합니다.

<br/><br/><br/>


## Receive Transfer Details and Results with a Delegate

task의 동작 과정에 더 높은 접근 수준을 위해서 data task를 생성할 때 completion handler를 제공하는 대신에 session에 delegate를 설정할 수 있습니다. `Figure 2`는 이 방법을 보여줍니다.

**Figure 2** Implementing a delegate to receive results from a task  

![](https://docs-assets.developer.apple.com/published/8b22355c7f/730c8e1b-654f-4eb9-9c63-d439a69ac5d2.png)

이 방법으로 전송이 완료되거나 에러로 실패할 때까지 데이터의 일부가 도착할 때 `URLSessionDataDelegate`의 `urlSession(_:dataTask:didReceive:)` 메서드에 제공됩니다. delegate는 전송이 진행됨에 따라 다른 종류의 이벤트도 수신합니다.  
  
delegate 방법을 사용할 때 `URLSession` 클래스의 간단한 `shared` 인스턴스를 사용하는 것 대신 당신 자신의 URLSession 인스턴스를 생성해야 합니다. `Listing 2`에서 보여주듯이 새로운 session을 만들면 당신 자신의 클래스를 session의 delegate로 설정할 수 있습니다.  
  
클래스가 하나 이상의 delegate 프로토콜(URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate, URLSessionDownloadDelegate)을 구현하도록 선언합니다. 그리고 생성자 `init(configuration:delegate:delegateQueue:)`으로 URL session 인스턴스를 생성합니다. 이 생성자와 함께 사용되는 configuration 인스턴스를 커스터마이징 할 수 있습니다. 예를 들어 `waitsForConnectivity`를 `true`로 설정하는 것이 좋습니다. 이 방법으로 session은 필요한 연결이 허용되지 않은 경우 즉시 실패하는 대신에 적합한 연결을 기다립니다.  
  
**Listing 2** Creating a URLSession that uses a delegate

~~~swift
private lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true
    return URLSession(configuration: configuration,
                      delegate: self, delegateQueue: nil)
}()
~~~

`Listing 3`는 이 session을 사용하여 data task를 시작하는 `startLoad()` 메서드와, 수신된 data와 error을 처리하는 delegate 콜백의 사용을 보여줍니다.
- `urlSession(_:dataTask:didReceive:completionHandler:)`은 응답에 성공적인 HTTP 상태 코드가 있는지, MIME 타입이 text/html 또는 text/plain 인지 확인합니다. 이 중 하나라도 충족하지 않으면 task는 취소되고, 그렇지 않으면 계속 진행됩니다.
- `urlSession(_:dataTask:didReceive:)`는 task에서 수신한 각 `Data` 인스턴스를 `receivedData` 버퍼에 추가합니다.
- `urlSession(_:task:didCompleteWithError:)`는 먼저 전송 단계 에러가 발생했는지 확인합니다. 에러가 없다면 `receivedData` 버퍼를 string으로 변환을 시도하고 webView의 컨텐츠로 설정합니다.

**Listing 3** Using a Delegate with a URL session data task

~~~swift
var receivedData: Data?

func startLoad() {
    loadButton.isEnabled = false
    let url = URL(string: "https://www.example.com/")!
    receivedData = Data()
    let task = session.dataTask(with: url)
    task.resume()
}

// delegate methods

func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
                completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
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
    self.receivedData?.append(data)
}

func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
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
~~~

다양한 delegate 프로토콜은 인증 처리 문제, 후속 리디렉트, 다른 특별한 경우 등 위 코드에 나와있는 것을 넘어서는 메서드를 제공합니다. URLSession discussion에서 URLSession을 사용할 때 전송 중 발생하는 다양한 콜백을 설명합니다.

<br/><br/><br/>



# 샘플 프로젝트

배운 내용을 샘플 프로젝트로 만들어 확인해보자.

## 📌 [Receive Results with a Completion Handler 샘플 프로젝트](./ReceiveResultsWithACompletionHandler)

### 1. 스토리보드 구성

- Xcode로 새 iOS 프로젝트를 만든다.
- 프로젝트 생성시 만들어진 ViewController을 사용한다.
- ViewController에 WebKit View를 추가하고 아웃렛을 생성한다.

~~~swift
@IBOutlet var webView: WKWebView!
~~~

- WebKit View 하단에 버튼 2개 `Apple`, `Developer`를 추가하고 터치 액션을 추가한다.

~~~swift
@IBAction func touchUpAppleButton(_ sender: UIButton) {
}

@IBAction func touchUpDeveloperButton(_ sender: UIButton) {
}
~~~

### 2. 코드

- 문서의 startLoad() 메서드를 가져와서 url을 매개변수로 받도록 수정한다.

~~~swift
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
~~~

- 버튼을 누르면 애플 홈페이지, 애플 개발자의 해당 문서 페이지를 로드한다.

~~~swift
@IBAction func touchUpAppleButton(_ sender: UIButton) {
    startLoad(with: "https://www.apple.com/kr/")
}
@IBAction func touchUpDeveloperButton(_ sender: UIButton) {
    startLoad(with: "https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory")
}
~~~

- 에러 핸들링은 특별한 처리 없이 디버깅 메시지를 출력한다. (실제 프로젝트에서는 적절한 처리를 해줘야겠지?!)

~~~swift
func handleClientError(_ error: Error?) {
    print(">> error: \(error.debugDescription)")
}

func handleServerError(_ response: URLResponse?) {
    print(">> response: \(response.debugDescription)")
}
~~~

### 3. 동작

`Apple` 버튼을 누르면 애플 홈페이지로, `Developer`을 누르면 애플 개발자의 해당 문서 페이지가 webView에 띄워진다.  
  
만약 애플 서버 문제로 로드되지 않는다면 콘솔 창에 `response`의 디버깅 메시지가 출력될 것이다.

<br/><br/><br/>



## 📌 [Receive Transfer Details and Results with a Delegate 샘플 프로젝트](./ReceiveTransferDetailsAndResultsWithADelegate)

### 1. 스토리보드 구성

- Xcode로 새 iOS 프로젝트를 만든다.
- 프로젝트 생성시 만들어진 ViewController을 사용한다.
- ViewController에 WebKit View를 추가하고 아웃렛을 생성한다.

~~~swift
@IBOutlet var webView: WKWebView!
~~~

- WebKit View 하단에 버튼 `Load`를 추가하고 아웃렛과 터치 액션을 추가한다.

~~~swift
@IBOutlet var loadButton: UIButton!
@IBAction func touchUpLoadButton(_ sender: UIButton) {
}
~~~

### 2. 코드

- 문서의 코드를 가져와서 Load 버튼을 누르면 startLoad() 메서드를 호출한다.

~~~swift
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
~~~

- ViewController를 익스텐션하여 URLSessionDataDelegate 프로토콜을 채택하고 델리게이트 메서드를 이곳으로 옮긴다.
    - URLSessionDelegate 프로토콜을 채택하면 동작하지 않는다!!! 사용된 델리게이트 메서드는 URLSessionDataDelegate의 메서드다.

~~~swift
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
~~~

### 3. 동작

`Load`을 누르면 애플 개발자의 해당 문서 페이지가 webView에 띄워진다.