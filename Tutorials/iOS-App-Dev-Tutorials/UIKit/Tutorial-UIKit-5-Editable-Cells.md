# [공식문서로 iOS 배우기] UIKit Tutorial - 5. Editable Cells

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 Table View에 cell 등록하기](#-table-view에-cell-등록하기)
- [📌 Date Picker의 Sytle 변경해주기](#-date-picker의-sytle-변경해주기)
- [📌 Cell의 edit control 표시하지 않기](#-cell의-edit-control-표시하지-않기)

<br/><br/><br/>



# Chapter 5. Editable Cells

여러 data source의 데이터 흐름을 제어하여 편집가능한 미리 알림을 지원합니다.

## Customizing Data Source

data source는 table view에 표시되는 cell을 제어합니다. 이제 편집을 위한 커스텀 cell이 있으므로 새 data source를 만들어 해당 cell을 표시합니다.  
  
이 튜토리얼에서는 미리 알림의 편집을 지원하도록 table view를 업데이트합니다. 이 과정에서 target-action, outlets, delegation 같은 중요한 패턴을 사용합니다.

### 1. Create an Edit Data Source

table view가 편집 모드일 때 table view에 cell을 표시하는 새 data source를 만듭니다. 서로 다른 세 종류의 cell을 dequeue, configure, display 하는 로직은 복잡해질 수 있습니다. data source 클래스에서 이 로직을 캡슐화하여 복잡성을 관리합니다. cell의 구성을 단순화하는 열거형 만드는 것으로 시작합니다.

### 2. Add Table View Data Source Methods

data source를 UITableViewDataSource에 적합하게 만드세요. 이전 섹션에서 만든 열거형을 사용하여 data source 메서드를 구현합니다.

### 3. Update the View Controller

새 data source를 사용하도록 view controller를 업데이트합니다. reminder detail view의 내비게이션 바에 편집 버튼을 추가합니다. 사용자가 편집 버튼을 탭하면 앱이 view data source에서 edit data source로 전환됩니다. 

### 4. Update the Data Source

data source는 하나의 미리 알림을 구성한다는 것을 기억하세요. data source 클래스에 reminder 프로퍼티를 추가합니다.  
  
table view는 미리 알림을 볼 때와 편집할 때 다른 cell을 표시합니다. table view의 모드가 변경될 때 data source 변경하여 다른 cell을 표시합니다.
  
### 5. Configuring the Data Source

data source가 관리하는 cell의 다양한 타입을 추적하는 데 도움 되는 열거형을 만들었습니다. 열거형을 사용하여 새 cell을 만듭니다. table view의 섹션에 새 cell을 만드는 helper 메서드를 만들어서 data source 메서드를 짧게 유지합니다. 작업을 완료하면 편집 버튼을 누를 때 미리 알림 정보가 표시됩니다.

#### 📌 Table View에 cell 등록하기

스텝 11에서 datelabelCell의 identifier를 tableView에 직접 등록하는데 왜 이것만 따로 등록할까?  

해당 스텝의 설명을 보자.

> Step 11  
>  
> table view에서 dequeueReusableCell(withIdentifier:for:)로 cell을 회수하려면 reuse identifier가 필요합니다. 등록되지 않은 identifier를 해당 메서드에 전달하면 예외가 발생하고 앱이 종료됩니다.

date label cell을 제외한 나머지 cell은 모두 스토리보드에서 해당 cell을 만들고 identifier를 작성해주었지만 date label cell은 스토리보드에서 만들지 않고 기본 UITableViewCell을 사용한다.  
  
아마도 cell에 label만 필요하므로 커스텀으로 만들지 않은 것 같다.  
  
어쨋든 identifier가 지정되지 않은 상태라서 직접 tableView.register()로 등록하지 않고 dequeueReusableCell(withIdentifier:for:)에 identifier를 넣어 호출한다면 앱이 종료될 수 있어서 등록해 주는 것이다.

### 6. Check Your Understanding

#### Q1. 

UIViewController의 하위클래스에  아래 메서드를 정의했다.

~~~swift
override func viewDidLoad() {
   super.viewDidLoad()
   navigationItem.setRightBarButton(editButtonItem, animated: false)
}
~~~

사용자가 Edit 버튼을 탭 하면 무슨 일이 생기는가?

A. 버튼은 기본 action을 호출합니다.

editButtonItem의 기본 action인 setEditing(_:, animated:)이 호출되며 이를 override하여 커스텀 할 수 있습니다.

#### Q2. 

table view가 존재하지 않는 identifier를 사용하여 cell을 dequeue하려 시도하면 무슨일이 발생하나요?

A. 앱이 종료됩니다.

#### Q3.

아래 data source 메서드에서 table view의 행을 나타내는 정수를 찾으려면 어떻게 해야하나요? 

~~~swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // find row
 }
~~~

A. `let row = indexPath.row`

#### 📌 Date Picker의 Sytle 변경해주기

이 튜토리얼에서는 Date Picker를 Sytle을 `Wheels`로 사용하고 있지만 시뮬레이터를 실행해보면 다른 모양의 Date Picker가 표시되어 무언가 잘못한 걸로 생각할 수 있다.  
  
튜툐리얼에서 Date Picker의 Preferred Style을 따로 건들지 않으므로 기본값인 Automatic으로 설정돼있다. 근데 iOS 14부터는 Date Picker의 기본 sytle이 Compact라서 Compact Sytle로 보이는 것이다.  
  
시뮬레이터의 iOS 버전에 상관없이 Wheels로 표시되도록 스토리보드에서 Date Picker의 Preferred Sytle 옵션을 `Wheels`로 변경해 주자.



## Canceling Edits

사용자는 마음을 바꾸거나 실수를 합니다. 사용자에게 미리 알림을 변경하기 전에 편집한 내용을 취소할 수 있는 간단한 메커니즘을 제공합니다.  
  
이 튜토리얼에서는 Foundation에 내장된 날짜 포맷팅 도구를 사용하여 날짜와 시간의 표시 모양을 개선합니다. reminder edit view에 취소 버튼을 추가하여 유저가 미리 알림의 원치 않는 변경의 저장하지 않을 수 있게 합니다.

### 1. Format the Date

Foundation에는 날짜 관련 작업을 도와주는 몇 개의 타입이 있습니다. 그 타입 중 하나는 DateFormatter 입니다. description 프로퍼티는 사용하기 쉽지만 사용자에게 정보를 표시하는 데 필요한 제어 수준을 제공하지 않습니다. DateForamtter는 `Date`를 사용자 친화적인 문자 표현으로 바꿀 수 있습니다.

#### 📌 Cell의 edit control 표시하지 않기

editButtonItem을 탭 하면 setEditing()이 호출되고 편집 모드로 변경되면서 cell의 왼쪽에 빨간색으로 edit control 아이콘이 표시된다. 내가 아이콘이 표시되도록 한게 아니라 프레임워크에서 기본적으로 제공하는 기능 같다. 이 아이콘이 안나오게 하는 방법이 아래 스텝에 설명되어있다.

> Step 3  
>  
> cell이 editable 하면 table view는 cell을 제거하거나 재정렬할 수 있는 control을 표시할 수 있습니다. 이 control이 view에 표시되지 않도록 false를 반환합니다.

즉, tableView(_:canEditRowAt:)에서 false를 반환하면 control 아이콘이 표시되지 않는다.

### 2. Configure the Cancel Button

사용자는 편집 내용을 검토하고 잠재적으로 취소해야 합니다. edit view에 취소 버튼을 추가합니다. edit view controller는 미리 알림의 사본을 수정합니다. 취소 버튼은 그 변경사항을 버리고 수정되지 않은 데이터를 남깁니다.


### 3. Check Your Understanding

#### Q1. 메서드의 선언에 @objc 를 달아야하는 이유는 무엇인가요?

A. #selector를 사용하여 함수를 호출하기 위해서

#### Q2. 전체 날짜 정보를 표시하도록 DateForamtter 인스턴스를 구성하는 방법은 무엇인가요?

A. `formatter.dateStyle = .full`

#### Q3. 

buttonTapped 메서드를 다음 이니셜라이저에 사용된 것으로 선언하는 방법은 무엇인가요?

~~~swift
UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonTapped)
~~~

A. `@objc func buttonTapped()`



## Editing Reminders

사용자가 미리 알림을 편집할 때 여러 view와 상호 작용합니다. callback을 사용하여 모든 view에 최신 데이터가 표시되도록 보장합니다.  
  
이 튜토리얼에서는 여러 view에 callback 프로퍼티를 추가합니다. 그리고 사용자 입력으로 미리 알림을 업데이트하는 로직을 추가합니다.

### 1. Support Editing the Title

사용자가 편집 화면에서 제목을 변경할 때 변경 내용을 목록 화면에도 적용하려고 합니다. 그러나 목록의 data source에 대한 참조 없이 직접 변경할 수 없습니다.  
  
Today 앱에서 callback으로 이 이슈를 해결합니다. data source는 callback을 정의하고 cell은 callback을 프로퍼티에 저장합니다. 사용자가 텍스트를 변경할 때 cell은 callback을 실행하고 변경된 텍스트를 전달합니다. callback은 data source를 업데이트하고 list view를 다시 로드합니다.

### 2. Create Callback to Title Cell

title cell에 클로저 프로퍼티가 있습니다. 사용자가 제목을 변경하면 cell은 클로저를 호출합니다. 이 섹션에서는 이 클로저를 사용하여 data source의 미리 알림 제목과 cell 제목의 동기화를 유지합니다.

### 3. Support Editable Notes

title cell에 사용한 패턴과 유사한 패턴을 사용하여 미리 알림의 note를 편집합니다. notes cell에 callback 프로퍼티를 추가하고 data source에 callback을 설정합니다. 사용자가 미리 알림의 note를 업데이트 하면 callback이 data source를 업데이트합니다.

### 4. Support Editing the Date

이 섹션에서는 date cell을 위한 callback을 추가합니다. 사용자가 미리 알림의 날짜를 업데이트하면 cell은 callback을 실행하고, callback은 data source를 업데이트합니다.  
  
사용자는 UIDatePicker로 날짜를 입력하므로 title과 notes fields에 사용한 delegate를 사용할 수 없습니다. 대신 action을 사용합니다.

### 5. Check Your Understanding

#### Q1. UITextField의 텍스트 변경에 대한 알림을 어떻게 받나요?

A. text field의 delegate를 설정하고 `textField(_:shouldChangeCharactersIn:replacementString)`를 구현합니다.

#### Q2. initializer 대신에 awakeFromNib()에서 클래스 설정을 수행하는 이유는 무엇인가요?

A. 스토리보드에서 오브젝트를 로드하기 때문에

#### Q3. TitleCell에 대한 callback을 설정하는 코드는 무엇인가요?

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



## Configuring Edit Mode

변경 내용을 취소하려면 편집 내용을 사용자의 영구 데이터와는 별도로 저장합니다. 사용자가 변경사항을 저장할 때만 영구 데이터의 임시 사본을 만듭니다.  
  
이 튜토리얼에서는 사용자가 편집중에 변경사항을 취소하는 기능을 작성합니다. 사용자가 Done을 탭 하면 table view를 포함하여 앱의 나머지 부분의 edit view의 업데이트를 변경합니다.

### 1. Create a Temporary Reminder

이 섹션에서는 사용자가 편집 모드를 토글할 때 data source를 바꾸어서 view controller를 업데이트합니다. 편집 모드를 위한 data source는 임시 미리 알림 구조체를 사용합니다. 사용자가 Cancel을 탭 하면 임시 미리 알림은 폐기되고 사용자의 원본 데이터는 변경되지 않습니다. 사용자가 변경을 허용하면 data source는 원본 데이터를 업데이트합니다.

### 2. Update the Data Source

이 섹션에서는 ReminderDetailViewController에 클로저 프로퍼티를 추가합니다. 이 클로저는 list view에 의해 설정되고 업데이트된 미리 알림을 반영하도록 table view row를 다시 로드합니다.  
  
data source와 table view의 조정하려면 미리 알림을 fetch 하고 update하는 helper 메서드를 만듭니다. 이 개념은 data source를 당장 읽기 쉽게 하고 이후에는 관리하기 쉽게 해줍니다. 이후의 튜토리얼에서 데이터 저장소를 단순한 배열에서 EventKit으로 옮길 때 이러한 추가 이점을 확인할 수 있습니다.

### 3. Check Your Understanding

#### Q1. 질문에 코드로 답하세요.

변수 `myClosure`가 nil이 아닐 때만 실행하는 방법은 무엇인가요?

~~~swift
typedef MyClosure = () -> ()
var myClosure: MyClosure?
~~~

A. `myClosure?()`

#### Q2. 질문에 코드로 답하세요.

아래 코드가 “Couldn’t find data source for reminder list” 메시지와 함께 fatal error라 발생하는 때는 언제인가요?

~~~swift
guard let item = myDataSource?.item(at: rowIndex) else {
    fatalError("Couldn't find data source for reminder list.")
}
~~~

A. myDataSoure가 nil일 때

#### Q3. IndexPath 타입의 변수 indexPath가 있다면, 어떻게 index path의 table view row를 다시 로드할 수 있나요?

A. `tableView.reloadRows(at: [indexPath], with: .automatic)`
