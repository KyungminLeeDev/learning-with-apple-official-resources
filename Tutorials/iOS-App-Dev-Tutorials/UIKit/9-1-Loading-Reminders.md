# Loading Reminders

EventKit 프레임워크는 사용자의 캘린더 이벤트와 미리 알림의 접근 권한을 제공합니다. EventKit을 사용하여 미리 알림 앱과 Today 앱 간에 데이터를 공유할 수 있습니다.

## 1. Request Access to User Data

캘린더 데이터베이스는 사용자의 캘린더와 미리 알림 데이터를 저장합니다. 앱이 데이터베이스에 접근하기 전에 반드시 사용자에게 허가를 받아야 합니다.  
  
이 섹션에서는 데이터베이스의 항목을 쿼리하고 수정하는 데 사용하는 EKEventStore 오브젝트를 인스턴스화합니다. 그리고 이벤트 저장소를 통해 사용자의 미리 알림에 대한 접근을 요청합니다.

## 2. Load Reminders

이 섹션에서는 이벤트 저장소에서 미리 알림을 로드하는 메서드를 작성합니다. 저장소는 EKReminder 오브젝트의 옵셔널 배열을 반환하므로, ReminderListDataSource의 새 프로퍼티에 저장하기 전에 Reminder 오브젝트로 변환해야합니다.

### 📌 compactMap과 map의 차이

EKEventStore에서 fetchReminders로 가져온 EKReminders를 Today 앱의 미리 알림 모델인 Reminder로 변환할 때 compactMap을 사용했고 map 과의 차이점이 설명돼있다.

> Step 8  
>  
> Like map(_:), the compactMap(_:) method performs the given transformation with each element of the collection, but it also unwraps optionals, discarding any that are nil.

compactMap은 map과 비슷하지만, 옵셔널 언랩핑하여 반환한다는 차이가 있다. 이때 nil이 되는 경우는 폐기되므로 compactMap을 사용하면 nil이 아닌 collection을 반환한다.

## 3. Display Reminders

이 섹션에서는 저장소에서 미리 알림을 검색하고 화면에 표시합니다.

## 4. Responding to Notifications

Today 앱은 사용자가 앱을 실행할 때 이벤트 저장소에서 미리 알림을 로드합니다. 그러나 Today 앱이 동작하는 동안 다른 앱과 프로세스가 저장소를 업데이트할 수 있습니다.  
  
앱의 최신 상태를 유지하기 위해 notification에 data source를 등록합니다. data source가 change notification을 받을 때마다 저장소에서 미리 알림 데이터를 다시 로드합니다.

### 📌 더 이상 사용되지 않는 옵저버 제거

더 이상 사용되지 않는 옵저버는 제거해 줘야 한다. 인스턴스가 메모리에서 해제될 때 시스템이 deinit()을 자동으로 호출해 주므로 옵저버로 등록한 클래스의 deinit()에서 옵저버를 제거해 주자.

> Step 4  
>  
> It’s your responsibility to remove observers when they’re no longer used. You can remove your class as an observer in its deinit method.


## 5. Check Your Understanding

### Q1. 사용자의 캘린더와 미리 알림 데이터에 대한 접근을 제공하는 클래스는 무엇인가요?

A. `EKEventStore`

### Q2. 앱이 미리 알림에 대한 접근권한을 물어볼 때 사용자가 "Dont't Allow"를 탭하면 미리 알림에 대한 이벤트 저장소의 authorization status는 무엇인가요?

A. `denied`

### Q3. 아래 코드 샘플에서 `fetched`의 타입은 무엇인가요?

~~~swift
let eventStore = EKEventStore()

func loadReminders() {
   let predicate = eventStore.predicateForReminders(in: nil)
   eventStore.fetchReminders(matching: predicate) { (fetched) in
      
   }
}
~~~

A. `[EKReminder]?`
