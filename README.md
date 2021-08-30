# Learning with Apple official resources

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FKyungminLeeDev%2Flearning-with-apple-official-resources&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

**애플 공식 자료로 학습한 내용을 정리하는 저장소**

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문을 참고하길 추천하며 가능한 링크를 남기겠습니다.
- 배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 링크합니다.

<br/><br/><br/>



## Documentation

### Foundation (Framework)

> 필수적인 데이터 타입, 컬렉션, 운영체제 서비스에 접근하여 앱을 위한 기본 기능 계층을 정의합니다.  
>   
> Foundation 프레임워크는 data storage, persistence, text processing, date and time calculations, sorting, filtering, networking을 포함하여 앱과 프레임워크를 위한 기본 기능 계층을 제공합니다. Foundation에서 정의한 클래스, 프로토콜과 데이터 타입은 macOS, iOS, watchOS, rmflrh tvOS SDK 모두에서 사용됩니다.

#### Networking

- [URL Loading System](./Documentation/Foundation/URL-Loading-System/URL-Loading-System.md): URL과 상호작용하고 표준 인터넷 프로토콜을 사용하여 서버와 통신합니다.
    - Article [Fetching Website Data into Memory](./Documentation/Foundation/URL-Loading-System/Fetching-Website-Data-into-Memory/Fetching-Website-Data-into-Memory.md): URL session에서 data task를 생성하여 데이터를 메모리에 직접 수신합니다.
        - [📌 Receive Results with a Completion Handler 샘플 프로젝트](./Documentation/Foundation/URL-Loading-System/Fetching-Website-Data-into-Memory/Fetching-Website-Data-into-Memory.md#-receive-results-with-a-completion-handler-샘플-프로젝트)
        - [📌 Receive Transfer Details and Results with a Delegate 샘플 프로젝트](./Documentation/Foundation/URL-Loading-System/Fetching-Website-Data-into-Memory/Fetching-Website-Data-into-Memory.md#-receive-transfer-details-and-results-with-a-delegate-샘플-프로젝트)

<br/><br/><br/>


## iOS App Dev Tutorials

### UIKit

> 오늘의 중요한 할 일 관리를 도와주는 `Today` 앱을 만들어보면서 iOS 앱을 만들기 위한 필수적인 프레임워크인 UIKit을 살펴봅니다.

- [UIKit Essentials](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-1-UIKit-Essentials.md): Xcode와 Interface Builder를 사용하여 적응형 인터페이스를 설계합니다.
- [Model-View-Controller](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-2-Model-View-Controller.md): 첫 Table view를 만들면서 UI 요소와 코드를 연결합니다.
- [Navigation](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-3-Navigation.md): 미리 알림의 디테일을 보여주는 view를 만들고 이 view를 내비게이션 계층 안에서 표시합니다.
- [Table Views and Data Sources](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-4-Table-Views-and-Data-Sources.md): 데이터에 접근하고 관리하는 패턴을 배우고 미리 알림 데이터를 보여주는 커스텀 cell을 만듭니다.
- [Editable Cells](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-5-Editable-Cells.md): 여러 data source의 데이터 흐름을 제어하여 편집가능한 미리 알림을 지원합니다.
- [Modality](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-6-Modality.md): Modal view에서 작업을 분리하고 새 미리 알림을 저장합니다.
- [Filtering Data](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-7-Filtering-Data.md): 함수형 프로그래밍 패턴을 적용하여 데이터 배열을 고유한 view로 필터링합니다.
- [Design and Animation](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-8-Design-and-Animation.md): 커스텀 view를 만들어서 진행률을 표시하고 앱의 시각 디자인을 개선합니다.
- [System Frameworks](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-9-System-Frameworks.md): 이벤트 저장소에 데이터를 저장할 때 Today 앱과 EventKit의 미리 알림을 동기화합니다.

## SwiftUI

<br/><br/><br/>



## Swift.org

- A Swift Tour
    - [a-swift-tour.playground](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour.playground)
    - [0. First program](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-0-first-program.md)
    - [1. Simple Values](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-1-simple-values.md)
    - [2. Control Flow](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-2-control-flow.md)
    - [3. Functions and Closures](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-3-functions-and-closures.md)
    - [4. Objects and Classes](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-4-objects-and-classes.md)
    - [5. Enumerations and Structures](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-5-enumerations-and-structures.md)
    - [6. Protocols and Extensions](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-6-protocols-and-extensions.md)
    - [7. Error Handling](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-7-error-handling.md)
    - [8. Generics](./Swift.org/welcome-to-swift/a-swift-tour/a-swift-tour-8-generics.md)
- Language Guide