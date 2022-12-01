# Adhering to Design

시각적 일관성을 확립하고, 기능을 알리고, 브랜드 아이덴티티에 맞게 하게하려면 앱 디자인에서 컬러와 타이포그래피가 중요합니다. UIKit과 함께 표준 시스템 컬러와 폰트를 적용하여 다른 iOS 앱과 일관되고 노력할 필요 없는 사용자 경험을 할 수 있습니다.  
  
이 튜토리얼에서는 Human Interface Guidelines의 iOS 디자인 컨벤션을 채택합니다. view에 시스템 컬러를 적용하고, 앱 아이콘과 일치하는 색상표를 사용하여 커스텀 뷰를 만들고, 텍스트 크기 변화에 동적으로 대응하는 시스템 폰트를 설정합니다.

## 1. Set Background and Tint Colors

프로젝트 파일에는 Today 앱의 UI 요소를 위한 컬러 견본이 에셋 카탈로그에 포함되어 있습니다. 컬러 견본은 시스템 컬러에 부합하며 Contrast를 증가하고 Transparency 줄이는 것 과 같은 accessibility setting의 변화, 게다가 라이트 모드나 다크 모드 같은 디바이스 setting에  자동으로 적응합니다.

## 2. Create Background Gradients

미리 알림 목록 화면은 segmented control의 각 필터를 위한 서로 다른 컬러의 그라데이션 배경이 있습니다. 이 섹션에서는 사용자 디바이스의 라이트 모드 또는 다크 모드에 반응하는 에셋 카탈로그의 견본을 사용하여 그라데이션 컬러를 설정합니다.

## 3. Add Gradient Background to Progress View

각 필터에 컬러를 정의했으니, reminder list view의 table view에 그라데이션 배경을 추가합니다. 사용자가 필터를 전환할 때 배경의 그라데이션을 업데이트하는 메서드를 추가합니다.

## 4. Customize a Text Field

이 섹션에서는 UITextField의 프로퍼티를 설정하여 미리 알림 제목 text filed를 커스터마이징 합니다. 이러한 외관과 동작의 작은 변경이 더 일 관된 앱 디자인을 만들고 사용자 경험을 개선합니다.

### 📌 Text Field의 UX 개선하기

1. Text Field는 사용자가 텍스트를 수정하기 위해 탭 하는 UI이므로 H.I.G에 명시된 대로 최소 터치 영역 44pt가 되도록 Title Text Filed의 높이를 44로 Contraint를 지정했다.
2. Border Sytle을 None으로 하여 주위 모양과 일치하기 했다.
3. Clear Button을 편집 중에 보이도록 설정하여 사용자가 텍스트를 일일이 지울 필요 없이 버튼 하나로 지울 수 있게 했다.

## 5. Change View Colors Based on App Conditions

Today 앱은 미리 알림이 보기 모드 또는 편집 모드인지 구분하는 시각적 표시를 제공합니다. 이 세션에서는 현재 모드에 기반하여 view 컬러를 프로그래밍적으로 변경하는 로직을 추가합니다.

## 6. Change Fonts for Reminder Details

타이포그래피는 컨텐츠의 정보 쳬계를 전달합니다. 이 섹션에서는 Today 앱의 label, text field, text view에 대한 폰트 스타일을 설정하여 구성요소를 시각적으로 구분하고 더 나아가서 보기 모드와 편집모드를 구분합니다.

### 📌 코드로 font 지정하기

> Step 5
> 
> preferredFont(forTextStyle:)은 사용자의 텍스트 설정에 따라 폰트 크기를 조정하는 지정된 텍스트 스타일을 반환합니다.

스토리보드에서 사용자가 입력하는 text의 폰트를 body로 설정해주었다. 하지만 dueDate를 표시하는 cell은 코드로만 추가하므로 스토리보드에서 설정할 수 없다. 아래 코드로 textLabel에 body 스타일 폰트를 설정해준다.

`cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)`

## 7. Check Your Understanding

### Q1. Back 버튼이나 toolbar item과 같은 인터랙티브 요소의 컬러에 영향을 주는 UINavigationBar의 프로퍼티는 무엇인가요?

A. `tintColor`

### Q2. 에셋 카탈로그의 에셋을 사용하여 UI 컬러를 만들때 사용하는 것은 무엇인가요?

A. `UIColor(named:)` initializer

### Q3. view에 그라데이션 컬러를 적용하는 코드는 무엇인가요?

~~~swift
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UIView(frame: frame)
let gradientLayer = CALayer()
let gradientColors = [UIColor.black.cgColor, UIColor.white.cgColor]

// Answer
gradientLayer.colors = gradientColors
gradientLayer.frame = frame
view.layer.addSublayer(gradientLayer)
~~~

### Q4. Attributes inspector에서 설정할 수 있는 UITextField의 특성은 무엇인가요?

A. Clear button behavior

### Q5. UIFont의 인스턴스로 폰트 스타일 `.body`를 어떻게 설정하나요?

A. Use the `preferredFont(forTextStyle: .body)` method.
