# URL Loading System

URL과 상호작용하고 표준 인터넷 프로토콜을 사용하여 서버와 통신합니다.

## Overview

URL Loading System은 https 같은 표준 프로토콜 또는 당신이 만든 커스텀 프로토콜을 사용하여 URL로 식별된 리소스에 대한 접근을 제공합니다. Loading은 비동기적으로 동작하므로 앱이 응답을 유지할 수 있으며 들어오는 데이터나 에러가 도착했을 때 그것을 처리할 수 있습니다.  
  
URLSession 인스턴스를 사용하여 하나 이상의 URLSessionTask 인스턴스를 만듭니다, 그것은 앱으로 데이터를 가져와서 반환하고, 파일을 다운로드하고, 또는 데이터와 파일을 원격 위치에 업로드할 수 있습니다. session을 설정하려면 URLSessionConfiguration 오브젝트를 사용합니다, 그것은 캐시와 쿠키를 어떻게 사용할 것인지, 또는 셀룰러 네트워크에 연결을 허용할지 여부와 같은 동작을 제어합니다.  
  
하나의 session을 반복 사용하여 task를 생성할 수 있습니다. 예를들어 웹 브라우저에는 regular 및 private 브라우징을 위한 별도의 session이 있을 수 있습니다. 여기서 private session은 해당 데이터를 캐시하지 않습니다. Figure 1은 이러한 구성으로 두 개의 session이 어떻게 여러 task를 생성할 수 있는지 보여줍니다.

**Figure 1** Creating tasks from URL sessions

![](https://docs-assets.developer.apple.com/published/4bf9c6d271/6789dd96-afdc-4c18-b8eb-01f9012dc04d.png)

각 session은 delagate와 연관되어 정기 업데이트(또는 에러)를 수신합니다. default delegate는 당신이 제공하는 completion handler block을 호출합니다. 당신의 custom delegate를 제공하기를 선택한 경우 이 block은 호출되지 않습니다.  
  
session이 백그라운드에서 실행되도록 설정할 수 있습니다. 그래서 앱이 suspeneded 되는 동안 시스템이 데이터를 다운로드하고 앱을 깨워서 결과를 제공할 수 있습니다.
