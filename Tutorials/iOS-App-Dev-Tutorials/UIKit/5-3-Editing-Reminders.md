# Editing Reminders

사용자가 미리 알림을 편집할 때 여러 view와 상호 작용합니다. callback을 사용하여 모든 view에 최신 데이터가 표시되도록 보장합니다.  
  
이 튜토리얼에서는 여러 view에 callback 프로퍼티를 추가합니다. 그리고 사용자 입력으로 미리 알림을 업데이트하는 로직을 추가합니다.

## 1. Support Editing the Title

사용자가 편집 화면에서 제목을 변경할 때 변경 내용을 목록 화면에도 적용하려고 합니다. 그러나 목록의 data source에 대한 참조 없이 직접 변경할 수 없습니다.  
  
Today 앱에서 callback으로 이 이슈를 해결합니다. data source는 callback을 정의하고 cell은 callback을 프로퍼티에 저장합니다. 사용자가 텍스트를 변경할 때 cell은 callback을 실행하고 변경된 텍스트를 전달합니다. callback은 data source를 업데이트하고 list view를 다시 로드합니다.

## 2. Create Callback to Title Cell

title cell에 클로저 프로퍼티가 있습니다. 사용자가 제목을 변경하면 cell은 클로저를 호출합니다. 이 섹션에서는 이 클로저를 사용하여 data source의 미리 알림 제목과 cell 제목의 동기화를 유지합니다.

## 3. Support Editable Notes

title cell에 사용한 패턴과 유사한 패턴을 사용하여 미리 알림의 note를 편집합니다. notes cell에 callback 프로퍼티를 추가하고 data source에 callback을 설정합니다. 사용자가 미리 알림의 note를 업데이트 하면 callback이 data source를 업데이트합니다.

## 4. Support Editing the Date

이 섹션에서는 date cell을 위한 callback을 추가합니다. 사용자가 미리 알림의 날짜를 업데이트하면 cell은 callback을 실행하고, callback은 data source를 업데이트합니다.  
  
사용자는 UIDatePicker로 날짜를 입력하므로 title과 notes fields에 사용한 delegate를 사용할 수 없습니다. 대신 action을 사용합니다.

## 5. Check Your Understanding

### Q1. UITextField의 텍스트 변경에 대한 알림을 어떻게 받나요?

A. text field의 delegate를 설정하고 `textField(_:shouldChangeCharactersIn:replacementString)`를 구현합니다.

### Q2. initializer 대신에 awakeFromNib()에서 클래스 설정을 수행하는 이유는 무엇인가요?

A. 스토리보드에서 오브젝트를 로드하기 때문에

### Q3. TitleCell에 대한 callback을 설정하는 코드는 무엇인가요?

~~~swift
class TitleCell {
    var changeAction: ((String) -> Void)?
}
class DataSource: UITableViewDataSource {
   var items: [String]
   func tableView(tableView, cellForRowAt: indexPath) -> UITableViewCell {
      var cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
      cell.changeAction = { (title) in
         // Update items array
      }
   }
}
~~~
