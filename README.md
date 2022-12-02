# Learning with Apple official resources

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FKyungminLeeDev%2Flearning-with-apple-official-resources&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

**애플 공식 자료로 학습하기**

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문을 참고하길 추천하며 가능한 링크를 남기겠습니다.
- 배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 링크합니다.

<br><br><br>         



## Developer Documentation

- [Foundation](./documentation/foundation/foundation.md)
    - `API Collection` [URL Loading System](./documentation/foundation/url_loading_system/url_loading_system.md)
        - `Article` [Fetching Website Data into Memory](./documentation/foundation/url_loading_system/fetching_website_data_into_memory/fetching_website_data_into_memory.md)
            - 📌 [Receive Results with a Completion Handler 예시](./documentation/foundation/url_loading_system/fetching_website_data_into_memory/fetching_website_data_into_memory.md#-receive-results-with-a-completion-handler-예시)
            - 📌 [Receive Transfer Details and Results with a Delegate 예시](./documentation/foundation/url_loading_system/fetching_website_data_into_memory/fetching_website_data_into_memory.md#-receive-transfer-details-and-results-with-a-delegate-예시)
- [Swift](./documentation/swift/swift.md)
    - `Article` [Preventing Timing Problems When Using Closures](./documentation/swift/preventing-timing-problems-when-using-closures.md) 
        - 📌 [비동기 호출의 결과를 잘못 사용하는 예](./documentation/swift/preventing-timing-problems-when-using-closures.md#-비동기-호출의-결과를-잘못-사용하는-예시)
- [UIKit](./documentation/uikit/uikit.md)
    - `Class` [UIApplication](./documentation/uikit/uiapplication/uiapplication.md)
        - `Topic` [Managing the preferred content size](./documentation/uikit/uiapplication/Managing-the-preferred-content-size.md)
        - 🧑🏻‍💻 [텍스트 크기 설정값 가져오기 예시](./documentation/uikit/uiapplication/Getting-the-Font-Sizing-Preference-Example.md)
    - `Class` [UIFont](./documentation/uikit/uifont/uifont.md)
        - `Sample Code` [Creating Self-Sizing Table View Cells](./documentation/uikit/uifont/creating_self-sizing_table_view_cells.md)
            - [Sample Code Project](./documentation/uikit/uifont/CreatingSelfSizingTableViewCells)

<br><br><br>



## Swift.org

- [A Swift Tour](./swift.org/swift-book/GuidedTour/a-swift-tour-0-first-program.md)
    - [Simple Values](./swift.org/swift-book/GuidedTour/a-swift-tour-1-simple-values.md)
    - [Control Flow](./swift.org/swift-book/GuidedTour/a-swift-tour-2-control-flow.md)
    - [Functions and Closures](./swift.org/swift-book/GuidedTour/a-swift-tour-3-functions-and-closures.md)
    - [Objects and Classes](./swift.org/swift-book/GuidedTour/a-swift-tour-4-objects-and-classes.md)
    - [Enumerations and Structures](./swift.org/swift-book/GuidedTour/a-swift-tour-5-enumerations-and-structures.md)
    - [Protocols and Extensions](./swift.org/swift-book/GuidedTour/a-swift-tour-6-protocols-and-extensions.md)
    - [Error Handling](./swift.org/swift-book/GuidedTour/a-swift-tour-7-error-handling.md)
    - [Generics](./swift.org/swift-book/GuidedTour/a-swift-tour-8-generics.md)

<br><br><br>




## iOS App Dev Tutorials

### [UIKit](./Tutorials/iOS-App-Dev-Tutorials/UIKit/0-0-UIKit.md)

- [Ch1. UIKit essentials](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-0-UIKit-Essentials.md)
    - [Getting Started with Today](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-1-Getting-Started-with-Today.md)
    - [Creating a Storyboard App](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-2-Creating-a-Storyboard-App.md)
        - [📌 스토리보드의 시작점 설정하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-2-Creating-a-Storyboard-App.md#-스토리보드의-시작점-설정하기)
        - [📌 Extension을 활용하여 코드 정리하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-2-Creating-a-Storyboard-App.md#-extension을-활용하여-코드-정리하기)
        - [📌 SF Symbol의 자동 확장](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-2-Creating-a-Storyboard-App.md#-sf-symbol의-자동-확장)
        - [📌 버튼의 최소 사이즈는 44x44pt](./Tutorials/iOS-App-Dev-Tutorials/UIKit/Tutorial-UIKit-1-UIKit-Essentials.md#-버튼의-최소-사이즈는-44x44pt)
    - [Setting Constraints with Auto Layout](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-3-Setting-Constraints-with-Auto-Layout.md)
        - [📌 Circle button의 constraint 확인](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-3-Setting-Constraints-with-Auto-Layout.md#-circle-button의-constraint-확인)
        - [📌 Title label의 constraint 확인](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-3-Setting-Constraints-with-Auto-Layout.md#-title-label의-constraint-확인)
        - [📌 Date label의 constraint 확인](./Tutorials/iOS-App-Dev-Tutorials/UIKit/1-3-Setting-Constraints-with-Auto-Layout.md#-date-label의-constraint-확인)
- [Ch2. Model-View-Controller](./Tutorials/iOS-App-Dev-Tutorials/UIKit/2-0-Model-View-Controller.md)
    - [Connecting View Objects to Code](./Tutorials/iOS-App-Dev-Tutorials/UIKit/2-1-Connecting-View-Objects-to-Code.md)
    - [Connectiong Outlets and Actions](./Tutorials/iOS-App-Dev-Tutorials/UIKit/2-2-Connectiong-Outlets-and-Actions.md)
        - [📌 strong 참조 타입](./Tutorials/iOS-App-Dev-Tutorials/UIKit/2-2-Connectiong-Outlets-and-Actions.md#-strong-참조-타입)
    - [Setting Up a Table View](./Tutorials/iOS-App-Dev-Tutorials/UIKit/2-3-Setting-Up-a-Table-View.md)
- [Ch3. Navigation](./Tutorials/iOS-App-Dev-Tutorials/UIKit/3-0-Navigation.md)
    - [Creating a Detail View Controller](./Tutorials/iOS-App-Dev-Tutorials/UIKit/3-1-Creating-a-Detail-View-Controller.md)
    - [Creating a Navigation Stack](./Tutorials/iOS-App-Dev-Tutorials/UIKit/3-2-Creating-a-Navigation-Stack.md)
        - [📌 Table view cell의 Disclosure Indicator](./Tutorials/iOS-App-Dev-Tutorials/UIKit/3-2-Creating-a-Navigation-Stack.md#-table-view-cell의-disclosure-indicator)
- [Ch4. Table Views and Data Sources](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-0-Table-Views-and-Data-Sources.md)
    - [Accessing your Entities](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-1-Accessing-your-Entities.md)
    - [Adopting Protocols and Inheritance](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-2-Adopting-Protocols-and-Inheritance.md)
    - [Configuring Table View Cells](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-3-Configuring-Table-View-Cells.md)
        - [📌 @escaping annotation](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-3-Configuring-Table-View-Cells.md#-escaping-annotation)
    - [Applying Data Source Patterns](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-4-Applying-Data-Source-Patterns.md)
        - [📌 클래스 Initializer의 호출 순서](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-4-Applying-Data-Source-Patterns.md#-클래스-initializer의-호출-순서)
    - [Creating Custom Table View Cells](./Tutorials/iOS-App-Dev-Tutorials/UIKit/4-5-Creating-Custom-Table-View-Cells.md)
- [Ch5. Editable Cells](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-0-Editable-Cells.md)
    - [Customizing Data Source](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-1-Customizing-Data-Source.md)
        - [📌 Table View에 cell 등록하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-1-Customizing-Data-Source.md#-table-view에-cell-등록하기)
        - [📌 Date Picker의 Sytle 변경해주기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-1-Customizing-Data-Source.md#-date-picker의-sytle-변경해주기)
    - [Canceling Edits](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-2-Canceling-Edits.md)
        - [📌 Cell의 edit control 표시하지 않기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-2-Canceling-Edits.md#-cell의-edit-control-표시하지-않기)
    - [Editing Reminders](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-3-Editing-Reminders.md)
    - [Configuring Edit Mode](./Tutorials/iOS-App-Dev-Tutorials/UIKit/5-4-Configuring-Edit-Mode.md)
- [Ch6. Modality](./Tutorials/iOS-App-Dev-Tutorials/UIKit/6-0-Modality.md)
    - [Creating New Reminders](./Tutorials/iOS-App-Dev-Tutorials/UIKit/6-1-Creating-New-Reminders.md)
        - [📌 Navigation Controller의 Toolbar](./Tutorials/iOS-App-Dev-Tutorials/UIKit/6-1-Creating-New-Reminders.md#-navigation-controller의-toolbar)
    - [Saving New Reminders](./Tutorials/iOS-App-Dev-Tutorials/UIKit/6-2-Saving-New-Reminders.md)
- [Ch7. Filtering Data](./Tutorials/iOS-App-Dev-Tutorials/UIKit/7-0-Filtering-Data.md)
    - [Using Higher-Order Functions](./Tutorials/iOS-App-Dev-Tutorials/UIKit/7-1-Using-Higher-Order-Functions.md)
        - [📌 Date가 오늘인지 확인하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/7-1-Using-Higher-Order-Functions.md#-date가-오늘인지-확인하기)
    - [Working with a Dynamic Data Source](./Tutorials/iOS-App-Dev-Tutorials/UIKit/7-2-Working-with-a-Dynamic-Data-Source.md)
- [Ch8. Design and Animation](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-0-Design-and-Animation.md)
    - [Creating a Progress View](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-1-Creating-a-Progress-View.md)
        - [📌 view의 drawing을 다루는 CALayer](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-1-Creating-a-Progress-View.md#-view의-drawing을-다루는-calayer)
    - [Adhering to Design](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-2-Adhering-to-Design.md)
        - [📌 Text Field의 UX 개선하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-2-Adhering-to-Design.md#-text-field의-ux-개선하기)
        - [📌 코드로 font 지정하기](./Tutorials/iOS-App-Dev-Tutorials/UIKit/8-2-Adhering-to-Design.md#-코드로-font-지정하기)
- [Ch9. System Frameworks](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-0-System-Frameworks.md)
    - [Loading Reminders](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-1-Loading-Reminders.md)
        - [📌 compactMap과 map의 차이](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-1-Loading-Reminders.md#-compactmap과-map의-차이)
        - [📌 더 이상 사용되지 않는 옵저버 제거](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-1-Loading-Reminders.md#-더-이상-사용되지-않는-옵저버-제거)
    - [Saving Reminders](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-2-Saving-Reminders.md)
    - [Continuing Your Learning](./Tutorials/iOS-App-Dev-Tutorials/UIKit/9-3-Continuing-Your-Learning.md)