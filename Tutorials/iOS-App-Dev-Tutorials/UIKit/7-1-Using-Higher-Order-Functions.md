# Using Higher-Order Functions

Today 사용자는 앱 메인 화면에서 모든 미리 알림을 봅니다. 사용자 경험을 개선하기 위해서 filter를 사용하여 미리 알림을 today, future, all 등 3가지 카테고리로 나눕니다.

이 기능을 개발하면서 collection 작업에 유용한 몇가지 고차 함수를 배웁니다.

## 1. Filter Reminders by Due Date

이 섹션에서는 reminder list data source에서 필터링 기능을 구현합니다. 두 개의 고차 함수를 사용하며, 둘 다 동작을 커스터마이징 하기위해 클로저 파라미터를 사용합니다.

### 📌 Date가 오늘인지 확인하기

> Step 4  
>  
> Locale.current.calendar is the current calendar based on the user’s region settings.

`Locale.current.calendar`로 사용자 지역 설정에 기반한 캘린더에 접근하여 `isDateInToday(_:)` 메서드로 Date가 오늘인지 확인할 수 있다.

## 2. Add a Control for Switching filters

Data source에 필터를 설정했으니, Interfcae Builder를 사용하여 필터 간에 스위칭을 위해 segmented control을 구성합니다. UI를 view controller의 로직에 연결하여 이 기능을 완성합니다.

## 3. Format Dates by Filter

사용자는 이제 미리 알림 목록 화면에서 각기 다른 보기 모드를 스위칭 할 수 있습니다. 이 섹션에서는 선택된 필터에 기반한 미리 알림의 due date 텍스트를 포맷팅합니다.  
  
각 필터를 위해 DateFormatter 인스턴스를 만들고 포맷에 맞는 날짜 문자열을 표시하기 위해 foratter의 프로퍼티 dateStyle과 timeSytle을 설정합니다.

## 4. Check Your Understanding

### Q1. 마지막에 선택된 segment의 인덱스를 확인하는 UISegmentedControl의 프로퍼티는 무엇인가요?

A. `selectedSegmentIndex`

### Q2. collection을 순회하고 조건을 만족하는 요소의 배열을 반환하는 메서드는 무엇인가요?

A. `filter(_:)`

### Q3. 아래 포맷으로 날짜를 구성하는 date formatter는 무엇인가요?

`December 15, 2020 at 5:00 PM`

~~~swift
let formatter = DateFormatter()
formatter.dateStyle = .long
formatter.timeStyle = .short
formatter.locale = Locale(identifier: "en_US")
~~~
