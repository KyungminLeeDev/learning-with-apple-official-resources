# Setting Up a Table View

미리 알림 데이터를 목록으로 표시하기 위해서 table view controller를 만들어야 합니다. 이를 위해 하위 클래스 UITableViewController는 table view에 프로토콜과 특정 동작을 채택합니다. 그리고 UITableViewDataSource 프로토콜에서 메서드를 구현하여 table 데이터를 생성하고 관리합니다.  
  
starter 프로젝트를 다운받아 튜토리얼을 따라하거나, 완료된 프로젝트를 열어서 코드를 직접 살펴보세요.

## 1. Add The Table View

Xcode 템플릿에는 view controller의 기본 구현이 포함되어 있습니다. 이번 섹션에서는 템플릿 view controller을 리팩토링하여 reminder list 화면의 table view controller을 만듭니다.

## 2. Add Data Source Methods

Table view는 데이터의 표시만 관리합니다. 데이터 자체를 관리하지 않습니다. 데이터를 관리하기 위해서는 table과 data source 오브젝트(UITableViewDataSource 프로토콜을 구현하는 오브젝트)를 제공해야 합니다.  
  
이번 섹션에서는 table view controller에 data source 메서드를 추가합니다. data source 오브젝트는 table에서 데이터와 연관된 요청에 응답합니다. 또한 table의 데이터를 직접 관리하거나 앱의 다른 파트와 조정하여 해당 데이터를 관리합니다.

## 3. Check Your Understanding

### Q1. 방대한 양의 데이터를 처리할 때 table view의 성능을 개선할 수 있는 것은 무엇인가요?

Reusing cells

### Q2. Interface Builder에서 클래스 indentity field를 업데이트 해야하는 이유는 무엇인가요?

런타임에 view 계층의 아카이빙을 해제할 때 인스턴스화할 클래스를 결정하기 위해서

### Q3. 다음 중 table view data source에 필요하지 않은 것은 무엇인가요?

A method to insert or delete rows
