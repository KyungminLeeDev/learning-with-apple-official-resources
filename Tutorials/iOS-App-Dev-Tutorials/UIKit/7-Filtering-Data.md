# [공식문서로 iOS 배우기] UIKit Tutorial - 7. Filtering Data

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 Date가 오늘인지 확인하기](#-date가-오늘인지-확인하기)

<br/><br/><br/>



# Chapter 7. Filtering Data

함수형 프로그래밍 패턴을 적용하여 데이터 배열을 고유한 view로 필터링합니다.

## Using Higher-Order Functions

Today 사용자는 앱 메인 화면에서 모든 미리 알림을 봅니다. 사용자 경험을 개선하기 위해서 filter를 사용하여 미리 알림을 today, future, all 등 3가지 카테고리로 나눕니다.

이 기능을 개발하면서 collection 작업에 유용한 몇가지 고차 함수를 배웁니다.

### 1. Filter Reminders by Due Date

이 섹션에서는 reminder list data source에서 필터링 기능을 구현합니다. 두 개의 고차 함수를 사용하며, 둘 다 동작을 커스터마이징 하기위해 클로저 파라미터를 사용합니다.

#### 📌 Date가 오늘인지 확인하기

> Step 4  
>  
> Locale.current.calendar is the current calendar based on the user’s region settings.

`Locale.current.calendar`로 사용자 지역 설정에 기반한 캘린더에 접근하여 `isDateInToday(_:)` 메서드로 Date가 오늘인지 확인할 수 있다.

### 2. Add a Control for Switching filters

Data source에 필터를 설정했으니, Interfcae Builder를 사용하여 필터 간에 스위칭을 위해 segmented control을 구성합니다. UI를 view controller의 로직에 연결하여 이 기능을 완성합니다.

### 3. Format Dates by Filter

사용자는 이제 미리 알림 목록 화면에서 각기 다른 보기 모드를 스위칭 할 수 있습니다. 이 섹션에서는 선택된 필터에 기반한 미리 알림의 due date 텍스트를 포맷팅합니다.  
  
각 필터를 위해 DateFormatter 인스턴스를 만들고 포맷에 맞는 날짜 문자열을 표시하기 위해 foratter의 프로퍼티 dateStyle과 timeSytle을 설정합니다.

### 4. Check Your Understanding

#### Q1. 마지막에 선택된 segment의 인덱스를 확인하는 UISegmentedControl의 프로퍼티는 무엇인가요?

A. `selectedSegmentIndex`

#### Q2. collection을 순회하고 조건을 만족하는 요소의 배열을 반환하는 메서드는 무엇인가요?

A. `filter(_:)`

#### Q3. 아래 포맷으로 날짜를 구성하는 date formatter는 무엇인가요?

`December 15, 2020 at 5:00 PM`

~~~swift
let formatter = DateFormatter()
formatter.dateStyle = .long
formatter.timeStyle = .short
formatter.locale = Locale(identifier: "en_US")
~~~



## Working with a Dynamic Data Source

due date로 미리 알림을 필터링하는 segmented control을 추가했습니다. 필터링된 미리 알림의 변경 내용이 필터링 되지 않은 미리 알림 배열에 매핑되도록 data source를 업데이트 합니다.

### 1. Update Data Source Methods

필터링되고 정렬된 미리 알림 배열을 사용하여 Today 앱의 메인 화면에 테이블을 채우고 있습니다. 이 배열의 미리 알림 인덱스는 뒷단의 testData 배열의 인덱스와 맞지 않습니다.  
  
이 섹션에서는 필터링된 배열과 필터링되지 않은 배열의 미리 알림 간에 매핑하는 메서드를 추가합니다. 그리고 사용자가 미리 알림을 수정할 때 필터링 되지 않은 배열을 업데이트하는 메서드를 사용합니다.

### 2. Delete Reminders

이 섹션에서는 Today 앱에 삭제 기능을 추가합니다. 뒷 단의 배열에서 미리 알림을 삭제하는 메서드를 추가한 후에 table view에서 스와이프로 삭제하는 기능을 활성화합니다.

### 3. Check Your Understadning

#### Q1. collection에서 클로저를 사용하여 지정한 조건을 충족하는 첫 번째 요소의 인덱스를 반환하는 메서드는 무엇인가요?

A. `firstIndex(where:)`

#### Q2. 아래 코드에서 변수 selected의 타입은 무엇인가요?

~~~swift
var toppings = ["Bacon", "Ham", "Pineapple", "Olives" ]
var selected = toppings.firstIndex(where: { $0.contains("i") })
~~~

A. `Int?`

#### Q3. data source에 행을 삽입하거나 삭제하라는 메시지를 보내는 UITableViewDataSource 메서드는 무엇인가요?

A. `tableView(_:commit:forRowAt:)`
