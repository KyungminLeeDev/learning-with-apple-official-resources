# Working with a Dynamic Data Source

due date로 미리 알림을 필터링하는 segmented control을 추가했습니다. 필터링된 미리 알림의 변경 내용이 필터링 되지 않은 미리 알림 배열에 매핑되도록 data source를 업데이트 합니다.

## 1. Update Data Source Methods

필터링되고 정렬된 미리 알림 배열을 사용하여 Today 앱의 메인 화면에 테이블을 채우고 있습니다. 이 배열의 미리 알림 인덱스는 뒷단의 testData 배열의 인덱스와 맞지 않습니다.  
  
이 섹션에서는 필터링된 배열과 필터링되지 않은 배열의 미리 알림 간에 매핑하는 메서드를 추가합니다. 그리고 사용자가 미리 알림을 수정할 때 필터링 되지 않은 배열을 업데이트하는 메서드를 사용합니다.

## 2. Delete Reminders

이 섹션에서는 Today 앱에 삭제 기능을 추가합니다. 뒷 단의 배열에서 미리 알림을 삭제하는 메서드를 추가한 후에 table view에서 스와이프로 삭제하는 기능을 활성화합니다.

## 3. Check Your Understadning

### Q1. collection에서 클로저를 사용하여 지정한 조건을 충족하는 첫 번째 요소의 인덱스를 반환하는 메서드는 무엇인가요?

A. `firstIndex(where:)`

### Q2. 아래 코드에서 변수 selected의 타입은 무엇인가요?

~~~swift
var toppings = ["Bacon", "Ham", "Pineapple", "Olives" ]
var selected = toppings.firstIndex(where: { $0.contains("i") })
~~~

A. `Int?`

### Q3. data source에 행을 삽입하거나 삭제하라는 메시지를 보내는 UITableViewDataSource 메서드는 무엇인가요?

A. `tableView(_:commit:forRowAt:)`
