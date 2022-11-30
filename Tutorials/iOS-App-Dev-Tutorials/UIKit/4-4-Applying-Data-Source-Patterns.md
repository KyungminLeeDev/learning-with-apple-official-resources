# Applying Data Source Patterns

앱은 날짜와 시간을 다양한 형식으로 표시할 수 있습니다. 미리 알림의 날짜와 시간 정보를 신중하게 포맷팅하여 Today 사용자에게 훌륭한 경험을 제공할 수 있습니다.  
  
이 튜토리얼에서는 reminder detail table view와 그 데이터에 제공하는 새로운 data source를 정의합니다. 그런 다음 강력한 날짜 포맷팅 클래스를 사용하여 table view의 날짜와 시간을 커스터마이징합니다.

## 1. Create a Reminder Detail Data Source

Today 앱에서 extension을 사용하여 타입에 메서드를 추가합니다. 이 패턴은 타입의 인터페이스를 변경하지 않고 코드의 구조화를 유지하는 데 도움을 줍니다.  
  
reminder의 저장 프로퍼티를 포함하는 data source 클래스를 만듭니다. 프로토콜 메서드가 포함된 extension을 사용하여 UITableViewDataSource 프로토콜을 준수하도록 선언합니다.

### 📌 클래스 Initializer의 호출 순서

NSObject를 상속받은 하위 클래스 ReminderDetailViewDataSource에 initializer를 구현하여 프로퍼티를 초기화한다. 이때 자신의 프로퍼티를 먼저 모두 초기화하고 마지막에 super.init()을 호출해야 한다.

> Step 6  
>  
> Swift는 super.init()을 호출하기 전에 모든 저장 프로퍼티의 초기화를 요구합니다.

## 2. Update the Detail View Controller

이제 ReminderDetailDataSource를 가졌으니 새로운 data source를 사용하도록 detail view controller를 수정합니다.

## 3. Format Dates Displayed in Cells

이 섹션에서는 date formatter를 사용하여 앱의 날짜와 시간 label의 가독성을 개선합니다.

## 4. Check Your Understanding

### Q1. DateFormatter의 인스턴스가 하는 일은 무엇인가요?

A. Date 오브젝트의 커스텀 문자열 표현을 만듭니다.

### Q2. 시스템이 처음 접근할 대 초기화하는 저장 프로퍼티를 만드는 선언은 무엇인가요?

~~~swift
struct Reminder {
   lazy var dateFormatter: RelativeDateFormatter = RelativeDateFormatter()
}
~~~
