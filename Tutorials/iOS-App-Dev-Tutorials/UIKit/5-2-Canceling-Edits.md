# Canceling Edits

사용자는 마음을 바꾸거나 실수를 합니다. 사용자에게 미리 알림을 변경하기 전에 편집한 내용을 취소할 수 있는 간단한 메커니즘을 제공합니다.  
  
이 튜토리얼에서는 Foundation에 내장된 날짜 포맷팅 도구를 사용하여 날짜와 시간의 표시 모양을 개선합니다. reminder edit view에 취소 버튼을 추가하여 유저가 미리 알림의 원치 않는 변경의 저장하지 않을 수 있게 합니다.

## 1. Format the Date

Foundation에는 날짜 관련 작업을 도와주는 몇 개의 타입이 있습니다. 그 타입 중 하나는 DateFormatter 입니다. description 프로퍼티는 사용하기 쉽지만 사용자에게 정보를 표시하는 데 필요한 제어 수준을 제공하지 않습니다. DateForamtter는 `Date`를 사용자 친화적인 문자 표현으로 바꿀 수 있습니다.

### 📌 Cell의 edit control 표시하지 않기

editButtonItem을 탭 하면 setEditing()이 호출되고 편집 모드로 변경되면서 cell의 왼쪽에 빨간색으로 edit control 아이콘이 표시된다. 내가 아이콘이 표시되도록 한게 아니라 프레임워크에서 기본적으로 제공하는 기능 같다. 이 아이콘이 안나오게 하는 방법이 아래 스텝에 설명되어있다.

> Step 3  
>  
> cell이 editable 하면 table view는 cell을 제거하거나 재정렬할 수 있는 control을 표시할 수 있습니다. 이 control이 view에 표시되지 않도록 false를 반환합니다.

즉, tableView(_:canEditRowAt:)에서 false를 반환하면 control 아이콘이 표시되지 않는다.

## 2. Configure the Cancel Button

사용자는 편집 내용을 검토하고 잠재적으로 취소해야 합니다. edit view에 취소 버튼을 추가합니다. edit view controller는 미리 알림의 사본을 수정합니다. 취소 버튼은 그 변경사항을 버리고 수정되지 않은 데이터를 남깁니다.


## 3. Check Your Understanding

### Q1. 메서드의 선언에 @objc 를 달아야하는 이유는 무엇인가요?

A. `#selector`를 사용하여 함수를 호출하기 위해서

### Q2. 전체 날짜 정보를 표시하도록 DateForamtter 인스턴스를 구성하는 방법은 무엇인가요?

A. `formatter.dateStyle = .full`

### Q3. buttonTapped 메서드를 다음 이니셜라이저에 사용된 것으로 선언하는 방법은 무엇인가요?

~~~swift
UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonTapped)
~~~

A. `@objc func buttonTapped()`


