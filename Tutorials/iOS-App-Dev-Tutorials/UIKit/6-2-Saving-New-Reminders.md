# Saving New Reminders

Today 앱의 실제로 사용하려면 사용자가 만든 미리 알림을 반드시 저장해야 합니다.  
  
이 튜토리얼에서는 view controller와 data source를 업데이트하여 사용자가 만드는 새 미리 알림을 삽입합니다. 그런 다음 Xcode의 리팩토링 도구를 사용하여 앱에서 발전시킨 복잡한 data source 로직을 단순화할 수 있습니다.

## 1. Save Reminders to the Data Source

이 섹션에서는 앱의 미리 알림 추가 기능을 완성합니다. 현재 지원되는 보기 모드와 편집 모드에 추가로 새 미리 알림의 추가를 처리하도록 ReminderDetailViewController의 메서드를 수정하는 것으로 시작합니다. data source에 미리 알림을 삽입하는 메서드를 만든 다음에, `addAction` completion handler안에서 메서드를 호출합니다.

## 2. Refactor to Extract Methods

ReminderDetailViewController의 setEditing(_:animated:) 메서드가 커졌습니다. setEditing(_:animated:)에서 로직을 두 개의 메서드로 분리하여 추출하는 것으로 이 튜토리얼을 마칩니다. 한 메서드는 view mode를 전환하기 위한 것이고 또 다른 메서드는 edit mode로 전환합니다.

## 3. Check Your Understanding

### Q1. 질문에 코드로 답하세요.

`array[0]` 이 `10`과 같도록 `array`를 변경하는 코드는 무엇인가요?

A. `array.insert(10, at: 0)`

### Q2. 질문에 코드로 답하세요.

`currentNumber`에 `1`을 할당하는 코드는 무엇인가요?

~~~swift
var tempNumber: Int? = nil
var defaultNumber: Int = 1
~~~

A. `let currentNumber = tempNumber ?? defaultNumber`

### Q3. modal view controller을 dismiss하는 방법은 무엇인가요?

A. Call `dismiss(animated:)` on the presenting view controller
