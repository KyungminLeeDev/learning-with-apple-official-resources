# Creating a Navigation Stack

사용자는 목록 화면에서 디테일 화면으로 찾아갈 방법이 필요합니다. navigation controller를 추가하여 앱의 워크플로우에 detail view controller를 통합합니다. 그런 다음 UIKit에 포함된 segue 중 하나를 사용하여 화면 간의 전환을 애니메이션화할 수 있습니다.

## 1. Create a Navigation Controller

이번 섹션에서는 reminder list view controller를 navigation controller에 내장합니다. 그리고 미리 알림의 디테일을 보여줄 새로운 table view controller을 만듭니다. 마지막으로 사용자가 미리 알림 cell을 탭 하여 두 view controller 사이를 이동할 수 있도록 segue를 만듭니다.

### 📌 Table view cell의 Disclosure Indicator

table view cell의 Accessory 메뉴에서 Disclosure Indicator를 선택하면 cell의 우측에 오른쪽 화살표 모양이 생긴다.

> Step 2  
>  
> Disclosure Indicator는 이 cell을 탭 하면 새 scene으로 이동함을 사용자에게 알려줍니다.

위에 설명돼있듯이 이 cell을 누르면 새로운 화면으로 이동하여 더 자세한 내용을 볼 수 있다는 의미로 인식할 수 있다.

## 2. Perform a Segue

이번 섹션에서는 미리 알림의 디테일 화면을 표시하는 segue를 구성합니다. segue identifier를 확인하고 불러오는 view controller에 데이터를 주입합니다. 마지막으로, Today 앱의 새로운 내비게이션 기능을 테스트합니다.

## 3. Check Your Understanding

### Q1. table view controller가 스토리보드에서 initial view controller로 되어있습니다. 이제 table view controller에 naigation controller를 내장했다면 무엇이 initial view controller 인가요?

Navigation controller

### Q2. Interface Builder가 action과 outlet을 오브젝트에 연결할 수 있는지 결정하는 데 사용하는 것은?

Class identity

### Q3. 어떤 segue가 UINavigationController 스택에 destination view controller를 푸쉬하는가?

Show

