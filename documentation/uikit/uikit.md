# [UIKit](https://developer.apple.com/documentation/uikit)

> Construct and manage a graphical, event-driven user interface for your iOS, iPadOS, or tvOS app.

iOS, iPadOS 또는 tvOS 앱을 위한 그래픽적인, 이벤트 주도 사용자 인터페이스를 구성하고 다룹니다. 

<br>

## Overview

> UIKit provides a variety of features for building apps, including components you can use to construct the core infrastructure of your iOS, iPadOS, or tvOS apps. The framework provides the window and view architecture for implementing your UI, the event-handling infrastructure for delivering Multi-Touch and other types of input to your app, and the main run loop for managing interactions between the user, the system, and your app.

UIKit은 앱을 만들기 위한 다양한 기능을 제공하며, iOS, iPadOS 또는 tvOS 앱의 핵심 기반을 만들기 위해 사용할 수 있는 구성요소를 포함합니다. 프레임워크는 UI 구현을 위한 윈도우와 뷰 아키텍처, 멀티 터치와 그 외의 입력 유형을 위한 이벤트 처리 기반, 사용자, 시스템, 앱 간의 상호 작용을 관리하는데 필요한 메인 런 루프 등을 제공합니다. 

![](https://docs-assets.developer.apple.com/published/e9dc54c3f1/renderedDark2x-1661916508.png)

> UIKit also includes support for animations, documents, drawing and printing, text management and display, search, app extensions, resource management, and getting information about the current device. You can also customize accessibility support, and localize your app’s interface for different languages, countries, or cultural regions.

UIKit은 애니메이션, 문서, 그리기와 출력, 텍스트 관리와 디스플레이, 검색, 앱 확장, 자원 관리, 현재 기기에 대한 정보 가져오기를 위한 지원을 포함합니다. 접근성 지원을 커스터마이징 할 수 있고, 다른 언어, 국가, 문화적 지역을 위한 앱의 인터페이스를 지역화할 수 있습니다.

<br>

> UIKit works seamlessly with the `SwiftUI` framework, so you can implement parts of your UIKit app in SwiftUI or mix interface elements between the two frameworks. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.


UIKit은 `SwiftUI` 프레임워크와 매끄럽게 작동되어 SwiftUI에서 UIKit 앱의 일부를 구현하거나 두 프레임워크 사이의 인터페이스 요소를 혼합할 수 있습니다. 예를 들면, SwiftUI 뷰 안에 UIKit의 뷰와 뷰 컨트롤러를 넣을 수 있고, 그 반대도 가능합니다.

<br>

> To build a macOS app, you can use SwiftUI to create an app that works across all of Apple’s platforms, or use `AppKit` to create an app for Mac only. Alternatively, you can bring your UIKit iPad app to the Mac with `Mac Catalyst`.

macOS 앱을 만들기 위해, SwiftUI를 사용하여 애플의 모든 플랫폼에서 작동하는 앱을 만들거나, `AppKit`을 사용하여 Mac 전용 앱을 만들 수 있습니다. 그 대신에, UIKit iPad 앱을 `Mac Catalyst`를 사용하여 Mac으로 가져올 수 있습니다.

<br>

> ### Important 
>
>> Use UIKit classes only from your app’s main thread or main dispatch queue, unless otherwise indicated in the documentation for those classes. This restriction particularly applies to classes that derive from UIResponder or that involve manipulating your app’s user interface in any way.
> 
> UIKit 클래스는 앱의 메인 스레드 또는 메인 디스패치 큐에서만 사용하세요. 이 제약은 특히 UIResponder에서 파생되거나 앱의 유저 인터페이스를 어떤 방법으로든 다루는데 관련된 클래스에 적용됩니다.
