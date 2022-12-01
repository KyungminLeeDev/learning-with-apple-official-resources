# Creating New Reminders

Modality는 사용자의 독립적인 작업에 집중하고 사용자가 중요한 정보를 수신하고 필요한 경우 행동하도록 보장합니다.  
  
이 튜토리얼에서는 미리 알림을 추가하는 기능을 구축하기 시작합니다. Interface Builder를 사용하여 미리 알림 목록 화면에 Add 버튼을 추가합니다. Modal view로 새 미리 알림을 만드는 화면을 표시하는 동안에, view controller를 프로그래밍적으로 만들고 표시하는 방법을 배웁니다.

## 1. Configure a Toolbar

이 섹션에서는 Today 앱에서 새 미리 알림을 추가할 수 있는 UI를 만듭니다. 미리 알림 목록 화면에 toolbar와 버튼을 추가합니다. 그리고 viewDidAppear(_:) 메서드를 override하여 detail 화면에서는 toolbar를 숨깁니다.

### 📌 Navigation Controller의 Toolbar

> Step 1  
>  
> Navigation controllers manage an optional toolbar at the bottom of the screen.

Navigation Controller는 toolbar를 옵셔널로 지원하므로 Attributes inspector에서 옵션 체크박스를 선택하는 것만으로 간단히 toolbar를 추가할 수 있다.

## 2. Present a View Controller Modally

사용자가 미리 알림 목록의 한 행을 탭 하면 navigation controller는 detail controller은 현재 화면에 push합니다. 그러나 새 미리 알림을 만드는 것은 자족적인 task입니다. Modal Presentation은 navigation 구조 밖으로 task를 분리하여 사용자가 자족적인 task에 집중하게 합니다.  
  
사용자가 새 미리 알림을 만들기 위해 Add 버튼을 탭할 때 deatil controller를 modally하게 띄웁니다.

## 3. Configure the Add Reminder Action

현재 미리 알림 detail 화면에서 기존 미리 알림을 보거나 편집할 수 있습니다. View controller에 `isNew` Boolean 프로퍼티를 추가하여 미리 알림이 새로 만들어진 시기와 새 미리 알림을 처리할 reminderAddAction 클로저를 표시합니다.  
  
이 프로퍼티에 값을 할당하는 configure 메서드를 업데이트한 후에 ReminderListViewController에서 메서드의 호출을 업데이트합니다.

## 4. Check Your Understanding

### Q1. view가 나타날 때 애니메이션을 시작하는데 사용할 수 있는 view controller 메서드는 무엇인가요?

a. `viewDidappear(_:)`

### Q2. 다음 코드 샘플에 한 줄의 코드를 추가할 때 화면의 밑에서 위로 슬라이딩하여 올라가는, ShoppingCartViewControoler을 modally하게 나타내는 코드는 무엇인가요?

~~~swift
@IBAction func viewCartPressed(_ sender: UIBarButtonItem) {
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
  let cartController: ShoppingCartViewController = 
     storyboard.instantiateViewController(identifier: "ShoppingCartViewController")
  // your code here
}
~~~

A. `present(cartController, animated: true)`

### Q3. 현재 메모리에 view가 로드되있음을 알려주는 view controller의 Boolean 값 프로퍼티는 무엇인가요?

A. `isViewLoaded`



