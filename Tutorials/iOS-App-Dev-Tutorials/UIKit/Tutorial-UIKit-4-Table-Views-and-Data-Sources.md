# [공식문서로 iOS 배우기] UIKit Tutorial - 4. Table Views and Data Sources

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Apple Developer - [iOS App Dev Tutorials - UIKit](https://developer.apple.com/tutorials/app-dev-training)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.


<br/><br/><br/>



# Chapter 4. Table Views and Data Sources

데이터에 접근하고 관리하는 패턴을 배우고 미리 알림 데이터를 보여주는 커스텀 cell을 만듭니다.

## Accessing your Entities

프로퍼티에 접근 제한 수식어를 추가하여 다른 클래스가 접근하지 못하도록 할 수 있습니다. 접근 제어를 신중하게 연습하면 프로젝트에 버그가 만들어지지 않도록 보호할 수 있습니다.

### 1. Declaring Access

선언의 시작 부분에 접근 수식어를 추가하여 코드 entity에 대한 접근 수준을 지정합니다.

~~~swift
struct Employee {
    public var name = ""
    private func processPayroll() { ... }
}
~~~

Swift의 주요 접근 제어 수식어는 다음과 같습니다:

- public: 모든 코드, 모든 곳에서 이 entity에 접근할 수 있습니다.
- internal (default): 모듈이 정의된 모든 소스파일의 코드가 이 entity에 접근할 수 있습니다. 모듈은 응용 프로그램 또는 프레임워크를 구성하는 소스 파일의 모음입니다.
- private: 동일한 타입의 정의, 타입의 extension만 이 entity에 접근할 수 있습니다.

### 3. Controlling Access in Today 

Today 앱에서 다음과 같은 방법으로 프로퍼티와 기능에 대한 접근을 제어할 수 있습니다.

- 접근 제어를 사용하여 cell의 프로퍼티를 직접 수정하는 다른 entity로부터 보호합니다. table view cell을 구성하는 private 메서드를 추가합니다. 이렇게 하면 cell을 더 쉽게 구성하고 cell 클래스의 캡슐화를 개선할 수 있습니다.
- 접근 제어를 적용하여 cell의 동작을 캡슐화합니다. ReminderListCell은 사용자가 cell의 Done 버튼을 탭 하면 클로저를 실행하는 doneButtonTriggered 프로퍼티를 포함합니다. 이상적으로 reminder list cell만 done 액션을 트리거할 수 있습니다.

이제 Siwft의 접근 제어 수식어를 이해했으므로 각 프로퍼티, 메서드, 이니셜라이저를 스스로 다시 고려해보세요.
