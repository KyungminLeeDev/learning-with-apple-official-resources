# [공식문서로 iOS 배우기] UIKit Tutorial - 8. Design and Animation

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 view의 drawing을 다루는 CALayer](#-view의 drawing을-다루는-calayer)

<br/><br/><br/>



# Chapter 8. Design and Animation

커스텀 view를 만들어서 진행률을 표시하고 앱의 시각 디자인을 개선합니다.

## Creating a Progress View

사용자는 미리 알림에 반응할 때 진행률을 확인하고 싶어 합니다. progress view를 만들어서 사용자가 완료한 미리 알림의 퍼센트를 알 수 있게 합니다.  
  
이 튜토리얼에서는 Interface Builder에서 progress view를 디자인합니다. 그리고 view controller와 data model을 업데이트하여 사용자의 작업 완료에 따라서 progress view를 업데이트하고 미리 알림 목록 화면에서 필터를 스위칭 합니다.

### 1. Lay Out Views

Progress view는 여러 subview로 구성됩니다. — 완료된 미리 알림의 퍼센트를 보여주는 view, 완료되지 않은 미리 알림의 퍼센트를 보여주는 view, 다른 view의 레이아웃과 위치를 결정하는 container view.  
  
이 섹션에서는 Interface Builder를 사용하여 progress view를 만듭니다.

### 2. Set Up Constrains

이 섹션에서는 디바이스의 크기와 방향에 관계없이 progress view가 container view에 완벽히 맞도록 합니다. 

### 3. Connect Outlets to Views

이 섹션에서는 코드로 progress view를 업데이트할 수 있도록 outlet을 추가합니다. 그리고 progress view에 원형 모양을 만듭니다.

#### 📌 view의 drawing을 다루는 CALayer

> Step 6  
>  
> Every UIView is backed by a CALayer, which handles drawing the view. Setting the layer’s cornerRadius property applies rounded corners to the view.

UIView의 drawing을 CALayer가 다루므로 UIView의 layer에 접근하여 cornerRadius 프로퍼티에 값을 지정해서 view를 원형으로 만든다.

~~~swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let radius = view.bounds.size.width * 0.5 * 0.7
    progressContainerView.layer.cornerRadius = radius
}
~~~

### 4. Display Reminder Progress

이 섹션에서는 사용자가 필터를 변경할 때와 미리 알림을 만들거나 수정할 때 progress view를 업데이트하는 코드를 추가합니다. 사용자의 진행률을 계산하는 새 computed 프로퍼티를 추가하고 프로퍼티를 사용하여 progress view를 업데이트하는 함수를 만듭니다.

### 5. Update the Progress View

사용자가 미리 알림을 추가하거나 편집할 때 Today 앱은 progress view를 업데이트합니다. 이 섹션에서는 사용자가 미리 알림을 완료하거나 목록에서 삭제할 때 view를 업데이트하는 코드를 작성합니다.  
  
ReminderListDataSource에 두 개의 completion handler를 추가하여 사용자가 table view와 상호작용하고, 미리 알림을 완료하거나 스와이프하여 삭제할 때 progress view를 업데이트합니다.

### 6. Check Your Understanding

#### Q1. 전체 시퀀스의 요소에서 단일 값을 반환하는 메서드는 무엇인가요?

A. `reduce(into:_:_`

#### Q2. roundedView에 둥근 외곽을 적용하기 위해서 viewWillAppear(_:)에 추가할 코드는 무엇인가요?

~~~swift
override func viewWillAppear(_ animated: Bool) {
   super.viewWillAppear(animated)
   roundedView.layer.cornerRadius = 8
   // Your code here
}
~~~

A. `roundedView.layer.masksToBounds = true`
