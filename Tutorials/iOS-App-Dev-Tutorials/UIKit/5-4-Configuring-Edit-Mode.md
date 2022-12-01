# Configuring Edit Mode

변경 내용을 취소하려면 편집 내용을 사용자의 영구 데이터와는 별도로 저장합니다. 사용자가 변경사항을 저장할 때만 영구 데이터의 임시 사본을 만듭니다.  
  
이 튜토리얼에서는 사용자가 편집중에 변경사항을 취소하는 기능을 작성합니다. 사용자가 Done을 탭 하면 table view를 포함하여 앱의 나머지 부분의 edit view의 업데이트를 변경합니다.

## 1. Create a Temporary Reminder

이 섹션에서는 사용자가 편집 모드를 토글할 때 data source를 바꾸어서 view controller를 업데이트합니다. 편집 모드를 위한 data source는 임시 미리 알림 구조체를 사용합니다. 사용자가 Cancel을 탭 하면 임시 미리 알림은 폐기되고 사용자의 원본 데이터는 변경되지 않습니다. 사용자가 변경을 허용하면 data source는 원본 데이터를 업데이트합니다.

## 2. Update the Data Source

이 섹션에서는 ReminderDetailViewController에 클로저 프로퍼티를 추가합니다. 이 클로저는 list view에 의해 설정되고 업데이트된 미리 알림을 반영하도록 table view row를 다시 로드합니다.  
  
data source와 table view의 조정하려면 미리 알림을 fetch 하고 update하는 helper 메서드를 만듭니다. 이 개념은 data source를 당장 읽기 쉽게 하고 이후에는 관리하기 쉽게 해줍니다. 이후의 튜토리얼에서 데이터 저장소를 단순한 배열에서 EventKit으로 옮길 때 이러한 추가 이점을 확인할 수 있습니다.

## 3. Check Your Understanding

### Q1. 질문에 코드로 답하세요.

변수 `myClosure`가 nil이 아닐 때만 실행하는 방법은 무엇인가요?

~~~swift
typedef MyClosure = () -> ()
var myClosure: MyClosure?
~~~

A. `myClosure?()`

### Q2. 질문에 코드로 답하세요.

아래 코드가 “Couldn’t find data source for reminder list” 메시지와 함께 fatal error라 발생하는 때는 언제인가요?

~~~swift
guard let item = myDataSource?.item(at: rowIndex) else {
    fatalError("Couldn't find data source for reminder list.")
}
~~~

A. myDataSoure가 nil일 때

### Q3. IndexPath 타입의 변수 indexPath가 있다면, 어떻게 index path의 table view row를 다시 로드할 수 있나요?

A. `tableView.reloadRows(at: [indexPath], with: .automatic)`
