# [공식문서로 iOS 배우기] UIKit Tutorial - 4. Table Views and Data Sources

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 @escaping annotation](#-@escaping-annotation)
- [📌 클래스 Initializer의 호출 순서](-클래스-initializer의 호출 순서)

<br/><br/><br/>



# Chapter 4. Table Views and Data Sources

데이터에 접근하고 관리하는 패턴을 배우고 미리 알림 데이터를 보여주는 커스텀 cell을 만듭니다.

## Accessing your Entities

프로퍼티에 접근 제한 수식어를 추가하여 다른 클래스가 접근하지 못하도록 할 수 있습니다. 접근 제어를 신중하게 연습하면 프로젝트에 버그가 만들어지지 않도록 보호할 수 있습니다.

### 1. Declaring Access

선언의 시작 부분에 접근 수식어를 추가하여 코드 entity에 대한 접근 수준을 지정합니다.

~~~swift
struct Employee {
    public var name = ""
    private func processPayroll() { ... }
}
~~~

Swift의 주요 접근 제어 수식어는 다음과 같습니다:

- public: 모든 코드, 모든 곳에서 이 entity에 접근할 수 있습니다.
- internal (default): 모듈이 정의된 모든 소스파일의 코드가 이 entity에 접근할 수 있습니다. 모듈은 응용 프로그램 또는 프레임워크를 구성하는 소스 파일의 모음입니다.
- private: 동일한 타입의 정의, 타입의 extension만 이 entity에 접근할 수 있습니다.

### 2. Controlling Access in Today 

Today 앱에서 다음과 같은 방법으로 프로퍼티와 기능에 대한 접근을 제어할 수 있습니다.

- 접근 제어를 사용하여 cell의 프로퍼티를 직접 수정하는 다른 entity로부터 보호합니다. table view cell을 구성하는 private 메서드를 추가합니다. 이렇게 하면 cell을 더 쉽게 구성하고 cell 클래스의 캡슐화를 개선할 수 있습니다.
- 접근 제어를 적용하여 cell의 동작을 캡슐화합니다. ReminderListCell은 사용자가 cell의 Done 버튼을 탭 하면 클로저를 실행하는 doneButtonTriggered 프로퍼티를 포함합니다. 이상적으로 reminder list cell만 done 액션을 트리거할 수 있습니다.

이제 Siwft의 접근 제어 수식어를 이해했으므로 각 프로퍼티, 메서드, 이니셜라이저를 스스로 다시 고려해보세요.



## Adopting Protocols and Inheritance

Reminder list view controller에서 커스텀 클래스로 data source 메서드를 추출하면 클래스의 모듈성이 향상됩니다. 그러나 새로운 클래스는 table view에 데이터를 제공하기 위해 두 가지 프로토콜을 채택해야 합니다.  
  
이 글에서는 Swift의 프로토콜과 채택 방법에 대해 배웁니다.

### 1. Adopting Protocols

Swift 프로토콜은 동작의 set을 설명합니다. 이 행동들은 특성을 규정합니다. 원하는 수의 특성을 타입과 연결할 수 있습니다. 에를 들면, 타입에 moveable, drawable, searchable 프로토콜을 채택하여 선언할 수 있습니다.  
  
프로토콜은 단순히 이러한 행위를 기술하는 것이 아니라, 이러한 행위를 채택하는 타입은 이 것을 실제로 이행하는 것을 정의합니다.

~~~swift
struct Shape: Movable, Drawable, Searchable {
    // movable, drawable, searchable의 모든 동작을 여기에 구현합니다.
}
~~~

### 2. Extracting the Data Source Trait

Today 앱에서 UITableViewDataSource 특성을 그 자신의 data source 클래스로 추출하여 view 관리 클래스와 관련된 사항을 구분합니다. 커스텀 클래스는 UITableViewDataSource의 특성과 NSObjectProtocol의 자기성찰적 특성을 채택해야 합니다.:  
- UITableViewDataSource 프로토콜은 table view에 데이터를 제공하는 데 필요한 동작을 정의합니다. 이것은 NSObjectProtocol의 특성을 상속합니다.
- NSObjectProtocol은 프로토콜을 준수하고 적절한 메시지에 응답하는 기능을 정의합니다.
  
NSObject는 NSObjectProtocol을 채택하는 root 클래스 입니다. 그러므로, 새로운 클래스가 NSObject의 하위 클래스라면, 이것은 자동적으로 NSObjectProtocol을 채택합니다.



## Configuring Table View Cells

구조화된 프로젝트는 새 기능을 간단하게 추가하고 오류를 제한할 수 있습니다. 구조화하는 전략 중 하나는 view controller를 작게 유지하고 view의 관리에 집중하게 하는 것입니다.  
  
이번 튜토리얼에서는 table view cell 구성을 convenience 메서드로 통합한 다음 data source 로직을 새로운 클래스로 이동합니다.  

### 1. Configure the Cell

이전에는 코드의 프로퍼티를 table view cell의 UI 요소에 연결하기 위해 outlet을 만들었습니다. 이 섹션에서는 해당 outlet을 사용하여 화면에 표시되는 적절한 정보로 각 cell을 구성합니다.

#### 📌 @escaping annotation

configure()의 파라미터로 클로저 doneButtonAction을 넣으니 @escaping annotation을 추가하라는 에러가 발생한다. @escaping 추가하면 에러가 해결된다. 해당 스텝 설명을 보자.

> Step 4  
>  
> 클로저 파라미터는 클로저가 저장되고 함수가 반환된 후 실행될 때 @escaping 어노테이션이 필요합니다.

~~~swift
self.doneButtonAction = doneButtonAction
~~~

파라미터로 넘어온 클로저를 self에 저장하는 위 코드 때문에 @escaping을 추가하라는 에러가 발생한 것으로 보아서 이 경우에는 클로저를 저장하므로 @escaping을 붙여야 하는 것 같다.  
  
또한 이때 저장된 클로저는 cell의 done 버튼이 눌렸을 때 실행되는 클로저이므로 configure()가 반환된 후에 실행될 것이다. 그래서 함수가 반환된 후 실행되는 클로저에도 속하는 것 같다.

### 2. Extract Data Source Methods

앱이 커짐에 따라 view controller의 크기가 커지고 다양한 용도를 제공할 수 있습니다. 이 섹션에서는 view controller에서 데이터 fetching과 updating 관련 코드를 꺼냅니다. data source 로직을 그 자체의 클래스로 추출하면 이러한 클래스의 우려가 분리되고 view controller는 view 관리에 집중합니다.

### 3. Update the List View Controller

이제 data source 메서드를 view controller 외부로 옮겼으므로 view controller가 새로운 data source 오브젝트를 사용하도록 합니다.  
  
기본적으로, UITableViewController의 dataSource 프로퍼티는 자신을 참조합니다. Today앱은 view controller 로직으로부터 data source 로직을 분리한 외부 오브젝트를 사용합니다.

### 4. Check Your Understanding

#### Q1.

Today앱에는 Reminder, ReminderViewController 클래스가 있습니다.

`ReminderViewController`의 메서드에서 접근할 수 있는 `Reminder`의 프로퍼티는 무엇인가요?

~~~swift
struct Reminder {
   internal var isDone: Bool
   private var date: Date
   var dateString: String {
      return date.description
   }
}

class ReminderViewController: UIViewController {
   var reminder: Reminder
}
~~~

A. `isDone`과 `dateString`

#### Q2. 

UITableViewDelegate 프로토콜을 준수하는 커스텀 클래스를 작성하고 있습니다. UITableViewDelegate 프로토콜은 NSObjectProtocol을 준수합니다.  
  
클래스를 작성하는 가장 쉬운 방법은 무엇인가요?

NSObject의 하위클래스를 만들고 UITableViewDelegate를 모두 부합하는 커스텀 함수를 작성합니다.



## Applying Data Source Patterns

앱은 날짜와 시간을 다양한 형식으로 표시할 수 있습니다. 미리 알림의 날짜와 시간 정보를 신중하게 포맷팅하여 Today 사용자에게 훌륭한 경험을 제공할 수 있습니다.  
  
이 튜토리얼에서는 reminder detail table view와 그 데이터에 제공하는 새로운 data source를 정의합니다. 그런 다음 강력한 날짜 포맷팅 클래스를 사용하여 table view의 날짜와 시간을 커스터마이징합니다.

### 1. Create a Reminder Detail Data Source

Today 앱에서 extension을 사용하여 타입에 메서드를 추가합니다. 이 패턴은 타입의 인터페이스를 변경하지 않고 코드의 구조화를 유지하는 데 도움을 줍니다.  
  
reminder의 저장 프로퍼티를 포함하는 data source 클래스를 만듭니다. 프로토콜 메서드가 포함된 extension을 사용하여 UITableViewDataSource 프로토콜을 준수하도록 선언합니다.

#### 📌 클래스 Initializer의 호출 순서

NSObject를 상속받은 하위 클래스 ReminderDetailViewDataSource에 initializer를 구현하여 프로퍼티를 초기화한다. 이때 자신의 프로퍼티를 먼저 모두 초기화하고 마지막에 super.init()을 호출해야 한다.

> Step 6  
>  
> Swift는 super.init()을 호출하기 전에 모든 저장 프로퍼티의 초기화를 요구합니다.

### 2. Update the Detail View Controller

이제 ReminderDetailDataSource를 가졌으니 새로운 data source를 사용하도록 detail view controller를 수정합니다.

### 3. Format Dates Displayed in Cells

이 섹션에서는 date formatter를 사용하여 앱의 날짜와 시간 label의 가독성을 개선합니다.

### 4. Check Your Understanding

#### Q1. DateFormatter의 인스턴스가 하는 일은 무엇인가요?

A. Date 오브젝트의 커스텀 문자열 표현을 만듭니다.

#### Q2. 시스템이 처음 접근할 대 초기화하는 저장 프로퍼티를 만드는 선언은 무엇인가요?

~~~swift
struct Reminder {
   lazy var dateFormatter: RelativeDateFormatter = RelativeDateFormatter()
}
~~~



## Creating Custom Table View Cells

Table view cell은 table view의 다양한 모양을 정의합니다. 보기 좋고 효율적인 사용자 경험을 제공하는 table view cell을 만드는 방법에 대해 배웁니다.  
  
이 튜토리얼에서는 새로운 미리 알림과 편집가능한 미리 알림을 지원하는 cell을 만듭니다.

### 1. Create Text Cells

기존의 cell은 텍스트를 표시하도록 설계되었습니다. 이 섹션에서는 text field, text view, date picker를 사용한 편집을 지원하는 cell을 만듭니다.

### 2. Add a Date Picker Control

이 섹션에서는 날짜를 수정하는 cell을 만듭니다. UIDatePicker는 날짜의 생성하고 수정하는 특별한 컨트롤입니다.

### 3. Define Cell View Classes

이 섹션에서는 view 하위 클래스를 만들어서 스토리보드에 있는 cell의 동작과 프로퍼티를 정의합니다.

### 4. Connect the Editing Cells

커스텀 cell 클래스의 IBOutlet을 사용하여 스토리보드의 view를 view 클래스에 연결합니다. 이 연결은 클래스에 cell 내부의 view에 대한 참조를 제공합니다.

### 5. Check Your Understanding

#### Q1. Interface Builder로 table view를 만들때 Xcode에 에러를 발생시키는 것은 무엇인가요?

A. 두 table view cell이 동일한 identifier를 가지는 것

#### Q2. 스토리보드의 view를 UIView의 하위 클래스의 @IBOutlet에 연결하는 이유는 무엇인가요?

A. UIKit이 하위 클래스를 초기화할 때 view를 참조하는 프로퍼티를 가지기 위해서.

