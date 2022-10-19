# [URL Loading System](https://developer.apple.com/documentation/foundation/url_loading_system)

> Interact with URLs and communicate with servers using standard Internet protocols.

URL과 상호작용하고 표준 인터넷 프로토콜을 사용하여 서버와 통신합니다.

## Overview

> The URL Loading System provides access to resources identified by URLs, using standard protocols like https or custom protocols you create. Loading is performed asynchronously, so your app can remain responsive and handle incoming data or errors as they arrive.

`URL Loading System`은 https 같은 표준 프로토콜 또는 당신이 만든 커스텀 프로토콜을 사용하여 URL로 식별된 리소스에 대한 접근을 제공합니다. `Loading`은 비동기적으로 동작하므로 앱이 응답을 유지할 수 있고, 데이터 또는 에러가 도착하면 처리할 수 있습니다.  
  
> You use a URLSession instance to create one or more URLSessionTask instances, which can fetch and return data to your app, download files, or upload data and files to remote locations. To configure a session, you use a URLSessionConfiguration object, which controls behavior like how to use caches and cookies, or whether to allow connections on a cellular network.

`URLSession` 인스턴스를 사용하여 하나 이상의 `URLSessionTask` 인스턴스를 만듭니다, 그것은 앱으로 데이터를 가져와서 반환하거나, 파일을 다운로드하거나, 데이터와 파일을 원격 위치에 업로드할 수 있습니다. `session`을 설정하려면 `URLSessionConfiguration` 오브젝트를 사용하세요, 그것은 캐시와 쿠키를 어떻게 사용할 것인지, 또는 셀룰러 네트워크에 연결을 허용할지 여부와 같은 동작을 제어합니다.  

> You can use one session repeatedly to create tasks. For example, a web browser might have separate sessions for regular and private browsing use, where the private session doesn’t cache its data. Figure 1 shows how two sessions with these configurations can then create multiple tasks.
  
하나의 `session`을 반복 사용하여 task를 생성할 수 있습니다. 예를 들어 웹 브라우저에는 `regular` 및 `private` 브라우징을 위한 별도의 `session`이 있을 수 있습니다. 여기서 `private session`은 해당 데이터를 캐시 하지 않습니다. `Figure 1`은 이러한 구성으로 두 개의 `session`이 어떻게 여러 task를 생성할 수 있는지 보여줍니다.  
  
**Figure 1** Creating tasks from URL sessions

![](https://docs-assets.developer.apple.com/published/4bf9c6d271/6789dd96-afdc-4c18-b8eb-01f9012dc04d.png)

> Each session is associated with a delegate to receive periodic updates (or errors). The default delegate calls a completion handler block that you provide; if you choose to provide your own custom delegate, this block is not called.

각 `session`은 `delegate`와 연관되어 정기 업데이트(또는 에러)를 수신합니다. `default delegate`는 당신이 제공하는 `completion handler block`을 호출합니다. 당신만의 커스텀 `delegate`를 제공하기를 선택한 경우 이 block은 호출되지 않습니다.  

> You can configure a session to run in the background, so that while the app is suspended, the system can download data on its behalf and wake up the app to deliver the results.
  
`session`이 백그라운드에서 실행되도록 설정할 수 있습니다. 그래서 앱이 `suspeneded`인 동안에 시스템이 데이터를 다운로드하고 앱을 깨워서 결과를 전달할 수 있습니다.
