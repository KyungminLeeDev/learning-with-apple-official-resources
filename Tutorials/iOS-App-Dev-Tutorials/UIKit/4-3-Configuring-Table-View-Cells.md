# Configuring Table View Cells

구조화된 프로젝트는 새 기능을 간단하게 추가하고 오류를 제한할 수 있습니다. 구조화하는 전략 중 하나는 view controller를 작게 유지하고 view의 관리에 집중하게 하는 것입니다.  
  
이번 튜토리얼에서는 table view cell 구성을 convenience 메서드로 통합한 다음 data source 로직을 새로운 클래스로 이동합니다.  

## 1. Configure the Cell

이전에는 코드의 프로퍼티를 table view cell의 UI 요소에 연결하기 위해 outlet을 만들었습니다. 이 섹션에서는 해당 outlet을 사용하여 화면에 표시되는 적절한 정보로 각 cell을 구성합니다.

### 📌 @escaping annotation

configure()의 파라미터로 클로저 doneButtonAction을 넣으니 @escaping annotation을 추가하라는 에러가 발생한다. @escaping 추가하면 에러가 해결된다. 해당 스텝 설명을 보자.

> Step 4  
>  
> 클로저 파라미터는 클로저가 저장되고 함수가 반환된 후 실행될 때 @escaping 어노테이션이 필요합니다.

~~~swift
self.doneButtonAction = doneButtonAction
~~~

파라미터로 넘어온 클로저를 self에 저장하는 위 코드 때문에 @escaping을 추가하라는 에러가 발생한 것으로 보아서 이 경우에는 클로저를 저장하므로 @escaping을 붙여야 하는 것 같다.  
  
또한 이때 저장된 클로저는 cell의 done 버튼이 눌렸을 때 실행되는 클로저이므로 configure()가 반환된 후에 실행될 것이다. 그래서 함수가 반환된 후 실행되는 클로저에도 속하는 것 같다.

## 2. Extract Data Source Methods

앱이 커짐에 따라 view controller의 크기가 커지고 다양한 용도를 제공할 수 있습니다. 이 섹션에서는 view controller에서 데이터 fetching과 updating 관련 코드를 꺼냅니다. data source 로직을 그 자체의 클래스로 추출하면 이러한 클래스의 우려가 분리되고 view controller는 view 관리에 집중합니다.

## 3. Update the List View Controller

이제 data source 메서드를 view controller 외부로 옮겼으므로 view controller가 새로운 data source 오브젝트를 사용하도록 합니다.  
  
기본적으로, UITableViewController의 dataSource 프로퍼티는 자신을 참조합니다. Today앱은 view controller 로직으로부터 data source 로직을 분리한 외부 오브젝트를 사용합니다.

## 4. Check Your Understanding

### Q1

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

### Q2

UITableViewDelegate 프로토콜을 준수하는 커스텀 클래스를 작성하고 있습니다.  UITableViewDelegate 프로토콜은 NSObjectProtocol을 준수합니다.  
클래스를 작성하는 가장 쉬운 방법은 무엇인가요?

A. NSObject의 하위클래스를 만들고 UITableViewDelegate를 모두 부합하는 커스텀 함수를 작성합니다.
