# [공식문서로 iOS 배우기] UIKit Tutorial - 6. Modality

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 Navigation Controller의 Toolbar](#-navigation-controller의-toolbar)

<br/><br/><br/>



# Chapter 6. Modality

Modal view에서 작업을 분리하고 새 미리 알림을 저장합니다.

## Creating New Reminders

Modality는 사용자의 독립적인 작업에 집중하고 사용자가 중요한 정보를 수신하고 필요한 경우 행동하도록 보장합니다.  
  
이 튜토리얼에서는 미리 알림을 추가하는 기능을 구축하기 시작합니다. Interface Builder를 사용하여 미리 알림 목록 화면에 Add 버튼을 추가합니다. Modal view로 새 미리 알림을 만드는 화면을 표시하는 동안에, view controller를 프로그래밍적으로 만들고 표시하는 방법을 배웁니다.

### 1. Configure a Toolbar

이 섹션에서는 Today 앱에서 새 미리 알림을 추가할 수 있는 UI를 만듭니다. 미리 알림 목록 화면에 toolbar와 버튼을 추가합니다. 그리고 viewDidAppear(_:) 메서드를 override하여 detail 화면에서는 toolbar를 숨깁니다.

#### 📌 Navigation Controller의 Toolbar

> Step 1  
>  
> Navigation controllers manage an optional toolbar at the bottom of the screen.

Navigation Controller는 toolbar를 옵셔널로 지원하므로 Attributes inspector에서 옵션 체크박스를 선택하는 것만으로 간단히 toolbar를 추가할 수 있다.

### 2. Present a View Controller Modally

사용자가 미리 알림 목록의 한 행을 탭 하면 navigation controller는 detail controller은 현재 화면에 push합니다. 그러나 새 미리 알림을 만드는 것은 자족적인 task입니다. Modal Presentation은 navigation 구조 밖으로 task를 분리하여 사용자가 자족적인 task에 집중하게 합니다.  
  
사용자가 새 미리 알림을 만들기 위해 Add 버튼을 탭할 때 deatil controller를 modally하게 띄웁니다.

### 3. Configure the Add Reminder Action

현재 미리 알림 detail 화면에서 기존 미리 알림을 보거나 편집할 수 있습니다. View controller에 `isNew` Boolean 프로퍼티를 추가하여 미리 알림이 새로 만들어진 시기와 새 미리 알림을 처리할 reminderAddAction 클로저를 표시합니다.  
  
이 프로퍼티에 값을 할당하는 configure 메서드를 업데이트한 후에 ReminderListViewController에서 메서드의 호출을 업데이트합니다.

### 4. Check Your Understanding

#### Q1. view가 나타날 때 애니메이션을 시작하는데 사용할 수 있는 view controller 메서드는 무엇인가요?

a. `viewDidappear(_:)`

#### Q2. 

다음 코드 샘플에 한 줄의 코드를 추가할 때 화면의 밑에서 위로 슬라이딩하여 올라가는, ShoppingCartViewControoler을 modally하게 나타내는 코드는 무엇인가요?

~~~swift
@IBAction func viewCartPressed(_ sender: UIBarButtonItem) {
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
  let cartController: ShoppingCartViewController = 
     storyboard.instantiateViewController(identifier: "ShoppingCartViewController")
  // your code here
}
~~~

A. `present(cartController, animated: true)`

#### Q3. 현재 메모리에 view가 로드되있음을 알려주는 view controller의 Boolean 값 프로퍼티는 무엇인가요?

A. `isViewLoaded`



## Saving New Reminders

Today 앱의 실제로 사용하려면 사용자가 만든 미리 알림을 반드시 저장해야 합니다.  
  
이 튜토리얼에서는 view controller와 data source를 업데이트하여 사용자가 만드는 새 미리 알림을 삽입합니다. 그런 다음 Xcode의 리팩토링 도구를 사용하여 앱에서 발전시킨 복잡한 data source 로직을 단순화할 수 있습니다.

### 1. Save Reminders to the Data Source

이 섹션에서는 앱의 미리 알림 추가 기능을 완성합니다. 현재 지원되는 보기 모드와 편집 모드에 추가로 새 미리 알림의 추가를 처리하도록 ReminderDetailViewController의 메서드를 수정하는 것으로 시작합니다. data source에 미리 알림을 삽입하는 메서드를 만든 다음에, `addAction` completion handler안에서 메서드를 호출합니다.

### 2. Refactor to Extract Methods

ReminderDetailViewController의 setEditing(_:animated:) 메서드가 커졌습니다. setEditing(_:animated:)에서 로직을 두 개의 메서드로 분리하여 추출하는 것으로 이 튜토리얼을 마칩니다. 한 메서드는 view mode를 전환하기 위한 것이고 또 다른 메서드는 edit mode로 전환합니다.

### 3. Check Your Understanding

#### Q1. 질문에 코드로 답하세요.

`array[0]` 이 `10`과 같도록 `array`를 변경하는 코드는 무엇인가요?

A. `array.insert(10, at: 0)`

#### Q2. 질문에 코드로 답하세요.

`currentNumber`에 `1`을 할당하는 코드는 무엇인가요?

~~~swift
var tempNumber: Int? = nil
var defaultNumber: Int = 1
~~~

A. `let currentNumber = tempNumber ?? defaultNumber`

#### Q3. modal view controller을 dismiss하는 방법은 무엇인가요?

A. Call `dismiss(animated:)` on the presenting view controller

