# Adopting Protocols and Inheritance

Reminder list view controller에서 커스텀 클래스로 data source 메서드를 추출하면 클래스의 모듈성이 향상됩니다. 그러나 새로운 클래스는 table view에 데이터를 제공하기 위해 두 가지 프로토콜을 채택해야 합니다.  
  
이 글에서는 Swift의 프로토콜과 채택 방법에 대해 배웁니다.

## 1. Adopting Protocols

Swift 프로토콜은 동작의 set을 설명합니다. 이 행동들은 특성을 규정합니다. 원하는 수의 특성을 타입과 연결할 수 있습니다. 에를 들면, 타입에 moveable, drawable, searchable 프로토콜을 채택하여 선언할 수 있습니다.  
  
프로토콜은 단순히 이러한 행위를 기술하는 것이 아니라, 이러한 행위를 채택하는 타입은 이 것을 실제로 이행하는 것을 정의합니다.

~~~swift
struct Shape: Movable, Drawable, Searchable {
    // movable, drawable, searchable의 모든 동작을 여기에 구현합니다.
}
~~~

## 2. Extracting the Data Source Trait

Today 앱에서 UITableViewDataSource 특성을 그 자신의 data source 클래스로 추출하여 view 관리 클래스와 관련된 사항을 구분합니다. 커스텀 클래스는 UITableViewDataSource의 특성과 NSObjectProtocol의 자기성찰적 특성을 채택해야 합니다.:  
- UITableViewDataSource 프로토콜은 table view에 데이터를 제공하는 데 필요한 동작을 정의합니다. 이것은 NSObjectProtocol의 특성을 상속합니다.
- NSObjectProtocol은 프로토콜을 준수하고 적절한 메시지에 응답하는 기능을 정의합니다.
  
NSObject는 NSObjectProtocol을 채택하는 root 클래스 입니다. 그러므로, 새로운 클래스가 NSObject의 하위 클래스라면, 이것은 자동적으로 NSObjectProtocol을 채택합니다.