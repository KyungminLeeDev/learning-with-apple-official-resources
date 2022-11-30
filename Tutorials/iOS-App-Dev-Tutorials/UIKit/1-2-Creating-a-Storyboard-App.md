# Creating a Storyboard App

UIKit은 앱을 만들기 위한 강력한 기반을 제공합니다. 새로운 Xcode 프로젝트를 만드는 것으로 시작하고, Interface Builder를 사용하여 앱의 첫 번째 scene을 배치합니다.  
  
다음 스텝을 따라서 새로운 프로젝트를 시작하거나, 완료된 프로젝트를 열어서 코드를 직접 살펴보세요.

## 1. Create a Project

Xcode는 모든 Apple 플랫폼의 다양한 타입의 앱에 대한 템플릿을 제공합니다. 이 템플릿은 basic source file, configuration file, build setting을 포함합니다.  
  
*Step 생략*  
  
## 2. Add a View Controller

Interface Builder를 사용해서 UIKit 앱의 뷰를 배치합니다. 뷰는 일반적으로 스토리보드 파일에 뷰의 모음과 뷰의 관계에 대한 정보로 저장됩니다.  
  
Today 앱 만들기를 시작할 시간입니다. Table View Controller를 사용하여 미리 알림 목록을 표시합니다. 스토리보드에 Table View Controller를 생성합니다.  
  
*Step 생략*  
  
### 📌 스토리보드의 시작점 설정하기

View Controller의 Attributes inspector에서 `Is Initial View Controller` 체크박스를 선택하면 스토리보드의 시작점으로 설정된다.

## 3. Create a Reminder Data Source

이번 섹션에서는 목록에 미리 알림을 나타내는 데이터 Model을 만듭니다. UIKit 앱의 공통 디자인 패턴인 Model-View-Controller (MVC) 디자인 패턴으로 앱을 구성합니다.  
  
Table View와 Cell 같은 View Object는 데이터를 시각적으로 표현합니다. Model Object는 앱의 데이터와 비즈니스 로직을 관리합니다. 당신은 View와 View Controller는 만들었습니다. 이제 Model을 만듭니다. Today 앱을 위한 Model은 `Reminder` 구조체로, 이름과 만기일 같은 프로퍼티를 나타냅니다.  
  
*Step 생략*  
  
### 📌 Extension을 활용하여 코드 정리하기
 
> **Step 5**  
> 
> Extension은 구조체나 클래스를 기능별로 분류하여 작고 집중되게 유지하면서 코드를 정리할 수 있게 도와줍니다.

Reminder 구조체에 프로퍼티들을 선언하고, 샘플 데이터는 extension으로 분리하여 정의했다.

~~~swift
//  Reminder.swift
struct Reminder {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension Reminder {
    static var testData = [
        // 생략...
    ]
}
~~~

## 4. Build a Prototype Cell with Interface Builder

이 섹션에서는 Interface Builder을 사용해서 Table View Cell의 미리 알림을 설계합니다. Prototype Cell을 사용하고, 제목, 날짜, 완료 상태를 표시하는 시각적인 요소를 추가합니다.  
  
*Step 생략*  
  
몇 개의 섹션만으로 Table View Controller를 root view로 추가했고 미리 알림의 세부사항을 보여주는 cell의 프로토타입을 만들었습니다. 다음은, Auto Layout이라 불리는 Interface Builder 기능을 사용할 것입니다. Auto Layout을 사용해서 동적으로 계산하고 object를 조정하는 규칙을 Prototype Cell에 적용하여 모든 방향과 서로 다른 디바이스에서 보기 좋게 될 것입니다.

### 📌 SF Symbol의 자동 확장

버튼의 Title을 지우고 Background를 SF Symbol의 circle로 설정했다.

> **Step 4**  
>  
> circle 아이콘과 같은 SF Symbol은 사용자의 Dynamic Type 설정에 따라 자동으로 확장됩니다.

iOS의 화면 확대 설정에 따라서 자동으로 아이콘의 크기가 조절된다는 의미라고 생각된다. 튜토리얼을 진행하며 확인할 수 있을 때 확인해봐야겠다.

### 📌 버튼의 최소 사이즈는 44x44pt

> **Step 5**  
> 
> 44*44pt는 Human Interface Guidelines 에서 접근성 표준을 충족하기 위해 필요한 최소 타겟 사이즈입니다.

[Human Iterface Guidelines](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/user-interaction)의 첫 문단에서 버튼의 사이즈를 44x44pt로 설정한 근거를 확인할 수 있다.

> **Human Iterface Guidelines - Gestures**  
> 
> 컨트롤 및 타겟과 상호작용하는 요소는 최소한 44*44pt이어야 합니다. 제한된 이동 능력을 가진 사람들은 앱과 상호작용할 수 있도록 더 큰 hit 타겟이 필요합니다. 너무 작은 컨트롤 요소는 유저가 불만스러울 정도로 조작하기 힘들 수 있습니다.

## 5. Check Your Understanding

### Q1. iOS에서 앱 아이콘의 아래에 보이는 문자에 영향을 주는 것은 새 프로젝트 옵션 패널의 어느 filed인가요?

A. Product Name

### Q2. 앱을 컴파일하고, 프레임워크를 연결하고, 리소스를 번들로 묶고, 바이너리를 시뮬레이터에 배포하는 명려은 무엇인가요?

A. Build and Run

### Q3. 서로 관련된 기능을 카테고리로 구성하여 클래스와 구조체를 작게 유지하는데 도움을 주는 Swift의 기능은 무엇인가요?

A. Extension