# Creating Custom Table View Cells

Table view cell은 table view의 다양한 모양을 정의합니다. 보기 좋고 효율적인 사용자 경험을 제공하는 table view cell을 만드는 방법에 대해 배웁니다.  
  
이 튜토리얼에서는 새로운 미리 알림과 편집가능한 미리 알림을 지원하는 cell을 만듭니다.

## 1. Create Text Cells

기존의 cell은 텍스트를 표시하도록 설계되었습니다. 이 섹션에서는 text field, text view, date picker를 사용한 편집을 지원하는 cell을 만듭니다.

## 2. Add a Date Picker Control

이 섹션에서는 날짜를 수정하는 cell을 만듭니다. UIDatePicker는 날짜의 생성하고 수정하는 특별한 컨트롤입니다.

## 3. Define Cell View Classes

이 섹션에서는 view 하위 클래스를 만들어서 스토리보드에 있는 cell의 동작과 프로퍼티를 정의합니다.

## 4. Connect the Editing Cells

커스텀 cell 클래스의 IBOutlet을 사용하여 스토리보드의 view를 view 클래스에 연결합니다. 이 연결은 클래스에 cell 내부의 view에 대한 참조를 제공합니다.

## 5. Check Your Understanding

### Q1. Interface Builder로 table view를 만들때 Xcode에 에러를 발생시키는 것은 무엇인가요?

A. 두 table view cell이 동일한 identifier를 가지는 것

### Q2. 스토리보드의 view를 UIView의 하위 클래스의 @IBOutlet에 연결하는 이유는 무엇인가요?

A. UIKit이 하위 클래스를 초기화할 때 view를 참조하는 프로퍼티를 가지기 위해서.

