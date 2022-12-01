# Customizing Data Source

data source는 table view에 표시되는 cell을 제어합니다. 이제 편집을 위한 커스텀 cell이 있으므로 새 data source를 만들어 해당 cell을 표시합니다.  
  
이 튜토리얼에서는 미리 알림의 편집을 지원하도록 table view를 업데이트합니다. 이 과정에서 target-action, outlets, delegation 같은 중요한 패턴을 사용합니다.

## 1. Create an Edit Data Source

table view가 편집 모드일 때 table view에 cell을 표시하는 새 data source를 만듭니다. 서로 다른 세 종류의 cell을 dequeue, configure, display 하는 로직은 복잡해질 수 있습니다. data source 클래스에서 이 로직을 캡슐화하여 복잡성을 관리합니다. cell의 구성을 단순화하는 열거형 만드는 것으로 시작합니다.

## 2. Add Table View Data Source Methods

data source를 UITableViewDataSource에 적합하게 만드세요. 이전 섹션에서 만든 열거형을 사용하여 data source 메서드를 구현합니다.

## 3. Update the View Controller

새 data source를 사용하도록 view controller를 업데이트합니다. reminder detail view의 내비게이션 바에 편집 버튼을 추가합니다. 사용자가 편집 버튼을 탭하면 앱이 view data source에서 edit data source로 전환됩니다. 

## 4. Update the Data Source

data source는 하나의 미리 알림을 구성한다는 것을 기억하세요. data source 클래스에 reminder 프로퍼티를 추가합니다.  
  
table view는 미리 알림을 볼 때와 편집할 때 다른 cell을 표시합니다. table view의 모드가 변경될 때 data source 변경하여 다른 cell을 표시합니다.
  
## 5. Configuring the Data Source

data source가 관리하는 cell의 다양한 타입을 추적하는 데 도움 되는 열거형을 만들었습니다. 열거형을 사용하여 새 cell을 만듭니다. table view의 섹션에 새 cell을 만드는 helper 메서드를 만들어서 data source 메서드를 짧게 유지합니다. 작업을 완료하면 편집 버튼을 누를 때 미리 알림 정보가 표시됩니다.

### 📌 Table View에 cell 등록하기

스텝 11에서 datelabelCell의 identifier를 tableView에 직접 등록하는데 왜 이것만 따로 등록할까?  

해당 스텝의 설명을 보자.

> Step 11  
>  
> table view에서 dequeueReusableCell(withIdentifier:for:)로 cell을 회수하려면 reuse identifier가 필요합니다. 등록되지 않은 identifier를 해당 메서드에 전달하면 예외가 발생하고 앱이 종료됩니다.

date label cell을 제외한 나머지 cell은 모두 스토리보드에서 해당 cell을 만들고 identifier를 작성해주었지만 date label cell은 스토리보드에서 만들지 않고 기본 UITableViewCell을 사용한다.  
  
아마도 cell에 label만 필요하므로 커스텀으로 만들지 않은 것 같다.  
  
어쨋든 identifier가 지정되지 않은 상태라서 직접 tableView.register()로 등록하지 않고 dequeueReusableCell(withIdentifier:for:)에 identifier를 넣어 호출한다면 앱이 종료될 수 있어서 등록해 주는 것이다.

## 6. Check Your Understanding

### Q1

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

### Q2

table view가 존재하지 않는 identifier를 사용하여 cell을 dequeue하려 시도하면 무슨일이 발생하나요?

A. 앱이 종료됩니다.

### Q3

아래 data source 메서드에서 table view의 행을 나타내는 정수를 찾으려면 어떻게 해야하나요? 

~~~swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // find row
 }
~~~

A. `let row = indexPath.row`

### 📌 Date Picker의 Sytle 변경해주기

이 튜토리얼에서는 Date Picker를 Sytle을 `Wheels`로 사용하고 있지만 시뮬레이터를 실행해 보면 다른 모양의 Date Picker가 표시되어 무언가 잘못한 걸로 생각할 수 있다.  
  
튜툐리얼에서 Date Picker의 Preferred Style을 따로 건들지 않으므로 기본값인 Automatic으로 설정돼있다. 근데 iOS 14부터는 Date Picker의 기본 sytle이 Compact라서 Compact Sytle로 보이는 것이다.  
  
시뮬레이터의 iOS 버전에 상관없이 Wheels로 표시되도록 스토리보드에서 Date Picker의 Preferred Sytle 옵션을 `Wheels`로 변경해 주자.



