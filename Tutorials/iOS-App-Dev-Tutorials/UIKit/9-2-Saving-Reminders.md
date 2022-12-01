# Saving Reminders

Today 앱이 거의 완성됐지만 추가해야 하는 몇 가지 중요한 기능이 있습니다. 미리 알림을 저장해야 하고 무언가 잘못됐을 때 alert controller를 띄워야 합니다.  
  
이 튜토리얼에서는 이벤트 저장소에 미리 알림을 저장하고 삭제합니다. 또한 저장 작업이 실패하면 사용자에게 alert controller를 띄웁니다.

## 1. Load a Specific Reminder

Today 앱은 내부의 미리 알림 모델을 사용하여 미리 알림을 보여줍니다. 이벤트 저장소에 미리 알림 데이터를 작성하기 전에 해당 EKReminder 오브젝트를 검색해야 합니다. 이 섹션에서는 지정된 identifier의 EKReminder 오브젝트를 검색하는 새 메서드를 작성합니다.

## 2. Save a Specific Reminder

이제 identifier로 EKReminder 오브젝트를 검색할 수 있습니다. 다음으로 이벤트 저장소에 미리 알림 데이터를 작성해야 합니다. 이 섹션에서는, 이벤트 저장소에 미리 알림 데이터를 저장하는 새 메서드를 작성합니다.

## 3. Update Reminder

이전 섹션에서 작성한 저장 메서드는 새 미리 알림을 작성하거나 기존 미리 알림을 업데이트할 때 작동합니다. 이 섹션에서는 새 저장 메서드를 호출하도록 `update(_:at:)` 메서드를 리팩토링합니다.

## 4. Create New Reminders

이 섹션에서는 이벤트 저장소에 새 미리 알림을 저장하도록 앱을 업데이트합니다.

## 5. Delete Reminders

이 섹션에서는 사용자가 table view에서 미리 알림을 삭제하기 위해 스와이프 할 때 이벤트 저장소에서 미리 알림을 제거하는 메서드를 추가합니다.

## 6. Implement Error Handling

이벤트 저장소의 변경이 성공했을 때만 앱이 table과 progress view를 업데이트합니다. 이 섹션에서는 작업이 실패했을 때 사용자에게 alert을 표시합니다.

## 7. Check Your Understanding

### Q1. 앱에 이벤트 알림 시스템을 추가하는 간단한 방법은 무엇인가요?

A. Create an EKReminder with an array of EKAlarm objects.

### Q2. 아래 UIAlertController을 만드는 `controllerSylte`과 `deletedActionStyle`값은 무엇인가요?

~~~swift
// Set styles
//let controllerStyle: UIAlertController.Style =
//let deleteActionStyle: UIAlertAction.Style =

// Answer
let controllerStyle: UIAlertController.Style = .alert
let deleteActionStyle: UIAlertAction.Style = .destructive

let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: controllerStyle)
alert.addAction(UIAlertAction(title: "Delete", style: deleteActionStyle, handler: { _ in } ))
alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { _ in } ))
self.present(alert, animated: true, completion: nil)
~~~
