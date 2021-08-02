# [공식문서로 iOS 배우기] UIKit Tutorial - 2. Model-View-Controller

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 strong 참조 타입](#-strong-참조-타입)

<br/><br/><br/>



# Chapter 2. Model-View-Controller

첫 Table view를 만들면서 UI 요소와 코드를 연결합니다.

## Connecting View Objects to Code

스토리보드에서 table의 행을 위한 view 오브젝트의 모양을 정의했습니다. 하지만 오브젝트와 코드를 연결하는 방법을 알아야 합니다. 코드는 action과 outlet 연결을 통해  view 오브젝트와 통신합니다.

### 1. Defining Actions and Outlets

`action`은 사용자가 버튼을 탭할 때처럼 앱에 특정한 이벤트가 발생할 때 트리거되는 함수입니다. 그러면 버튼은 타겟에 action 메시지를 보냅니다. 데이터 조작부터 UI 업데이트까지 모든 작업을 하는 action 메서드를 정의할 수 있습니다.  
  
`outlet`은 스토리보드의 오브젝트에서 소스 파일로 연결되는 참조입니다. 인터페이스 오브젝트의 값에 접근하거나 코드의 인터페이스 오브젝트를 수정하려면 view 오브젝트의 outlet이 필요합니다.  
  
예를 들어, 지도에서 차량 주행 경로와 보행 경로를 스위칭하기 위해 view 안에서 데이터를 필터링하기 위한 segmented control을 view 안에서 구현할 수 있습니다. 사용자가 경로의 종류 중에서 선택할 때 control이 알려주는 action을 연결할 수 있습니다. 그 다음 outlet은 연결하여 segemented index와 선택한 항목의 제목을 읽을 수 있습니다.

### 2. Making Connections

다음 튜토리얼에서는 스토리보드에서 reminder list cell의 button을 참조하는 outlet을 만듭니다. button의 상태와 모양을 변경하는 `action`도 만듭니다.  
  
button오브젝트를 view소스에 연결하기 위해 ReminderListCell 클래스에 다음 코드를 추가합니다.

~~~swift
@IBOutlet var doneButton: UIButton!
@IBAction func doneButtonTriggered(_ sender: UIButton) {
    doneButtonAction?()
}
~~~

button의 기본 클래스는 UIControl로, target-action 메커니즘을 사용하여 앱 사용자의 상호작용에 응답합니다. 사용자가 위의 예에서 sender 파라미터가 button으로 정의하는 컨트롤을 탭 하면 시스템이 @IBAction에서 메서드를 실행합니다. Today 앱에서 circle button을 탭 하면 미리 알림의 완료 상태가 설정되며 button의 모양을 filled circle로 전환하는 것으로 UI가 나타냅니다.  

이제 action과 outlet에 대한 배경지식을 알아보았습니다. Interface Builder를 사용하여 스토리보드에서 직접 코드와 UI 사이의 연결을 만듭니다.



## Connectiong Outlets and Actions

지금까지 Today의 root view에 prototype cell을 만들고 UI 오브젝트를 동적으로 조정하는 constraint를 추가했다. 이제 prototype cell의 오브젝트를 코드와 연결해야 합니다.  
  
이 튜토리얼에서는 outlet을 정의하여 UI 오브젝트를 클래스와 연결합니다. 사용자가 button과 상호작용할 때 트리거되는 action 메서드도 연결합니다.  
  
starter 프로젝트를 다운받아 튜토리얼을 따라하거나, 완료된 프로젝트를 열어서 코드를 직접 살펴보세요.

### 1. Create Outlet in Interface Builder

UI 오브젝트로 메시지를 보내는 코드를 사용하려면 UI 오브젝트를 클래스의 프로퍼티에 연결하는 outlet을 만듭니다. Interface Builder는 outlet에 대한 연결을 만들고 해당 outlet에 대한 선언이 없는 경우에 그 선언도 만들 수 있습니다.  

#### 📌 strong 참조 타입

스텝 8에서 titleLabel, dateLabel을 weak가 아닌 strong 참조 타입으로 설정하는 이유가 쓰여있다.

> Step 8  
>  
> 이 cell의 모든 outlet에 strong 참조 타입을 사용하면 size 클래스의 변경이 오브젝트의 할당을 취소하는 것을 방지할 수 있습니다.

가로/세로 모드 변경 등으로 size 클래스가 변경되는 경우에 weak 참조 타입이라면 할당이 취소되는 경우가 있어서 strong을 사용한다는 말 같은데, ARC와 연관된 내용 같고 구체적으로 어떤 상황인지 아직 잘 모르겠다.

