# Connectiong Outlets and Actions

지금까지 Today의 root view에 prototype cell을 만들고 UI 오브젝트를 동적으로 조정하는 constraint를 추가했다. 이제 prototype cell의 오브젝트를 코드와 연결해야 합니다.  
  
이 튜토리얼에서는 outlet을 정의하여 UI 오브젝트를 클래스와 연결합니다. 사용자가 button과 상호작용할 때 트리거되는 action 메서드도 연결합니다.  
  
starter 프로젝트를 다운받아 튜토리얼을 따라하거나, 완료된 프로젝트를 열어서 코드를 직접 살펴보세요.

## 1. Create Outlet in Interface Builder

UI 오브젝트로 메시지를 보내는 코드를 사용하려면 UI 오브젝트를 클래스의 프로퍼티에 연결하는 outlet을 만듭니다. Interface Builder는 outlet에 대한 연결을 만들고 해당 outlet에 대한 선언이 없는 경우에 그 선언도 만들 수 있습니다.  

### 📌 strong 참조 타입

스텝 8에서 titleLabel, dateLabel을 weak가 아닌 strong 참조 타입으로 설정하는 이유가 쓰여있다.

> Step 8  
>  
> 이 cell의 모든 outlet에 strong 참조 타입을 사용하면 size 클래스의 변경이 오브젝트의 할당을 취소하는 것을 방지할 수 있습니다.

가로/세로 모드 변경 등으로 size 클래스가 변경되는 경우에 weak 참조 타입이라면 할당이 취소되는 경우가 있어서 strong을 사용한다는 말 같은데, ARC와 연관된 내용 같고 구체적으로 어떤 상황인지 아직 잘 모르겠다.

## 2. Add Actions Programmatically

이번 섹션에서는 미리 알림의 완료 상태를 토글 하기 위한 circle button의 action을 만듭니다. outlet을 만든 방법과 같은 방법으로 action을 만들 수 있습니다. 또한 action 메서드를 먼저 만들고, 프로그래밍으로 연결할 수 있습니다.

## 3. Check Your Understanding

### Q1. UI 오브젝트를 코드의 프로퍼티에 연결하는 아이템은 무엇인가요?

Outlet

### Q2. 앱에서 특정 이벤트가 발생했을 때 트리거 하는 아이템은 무엇인가요?

Action

### Q3. outlet과 action이 코드와 연결됐다는 것을 어디서 확인할 수 있나요?

In the code editor

