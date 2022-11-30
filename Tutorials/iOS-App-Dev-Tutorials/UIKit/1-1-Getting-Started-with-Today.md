# Getting Started with Today

Apple 플랫폼의 필수적인 프레임워크인 UIKit으로 완벽히 동작하는 앱을 개발하는 방법을 배웁니다.  
  
이 모듈을 시작하기 전에, 요구 사항, 프레임워크, 샘플 앱을 숙지합니다.

## About This Module 

이 모듈은 Apple 플랫폼을 처음 접하는 경험 있는 개발자를 위해 설계되었습니다. SwiftUI 모듈과 비교해볼 수 있지만, SwiftUI 모듈을 먼저 완료할 필요는 없습니다. 이 모듈부터 시작한다면, Swift Langugage Guide의 [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)에서 Swift 기초를 복습하세요.

## Overview of UIKit

UIKit은 Apple 플랫폼에서 앱을 구축하기 위한 그래픽, 이벤트 기반의 프레임워크입니다.

UIKit의 특징
- Has extensive API coverage - 거의 또는 전혀 수정하지 않고 네이티브 앱을 만드는데 필요한 core object, view, control, 프레임워크를 포함하는 광범위한 라이브러리를 제공합니다.
- Includes Interface Builder - 복잡한 뷰와 그 관계를 시각적으로 설계할 수 있습니다. Interface builder와 Auto Layout로 모든 디바이스와 방향에서 UI를 보기 좋고 잘 작동할 것을 보장할 수 있습니다.
- Supports a rich legacy - iOS 13 이전에, 개발자들은 UIKit으로 모든 앱을 만들었습니다. 기존의 iOS, watchOS, tvOS 앱을 유지 보수하거나 확장하려면 UIKit에 대한 기초가 필요할 것입니다.
- Has strong community adoption - 수많은 UIKit 아티클과 커뮤니티 서포트 옵션에 접근할 수 있습니다.
- Is interoperable with SwiftUI - UIKit과 Swift를 간단히 통합시킬 수 있고 두 프레임워크의 장점을 사용할 수 있습니다.

## Tour of the App

이 모듈은 하루의 미리 알림을 보여주는 iOS 생산성 앱인 Today를 개발하는 과정을 가이드 합니다. 생산성 앱이 유익하지만 가끔은 스트레스를 유발할 수 있습니다. Today의 목표는 오늘 하루의 할 일에 집중하게 도와주며, 시각 디자인과 애니메이션을 사용하여 차분한 인터페이스를 제공하는 것입니다. Today의 화면을 살펴봅시다.

| 화면 | 설명 |
| :-----------: | ----------- |
| ![](https://docs-assets.developer.apple.com/published/e9de8f919b09f70bc818d9da5371d5f2/600/UIK_000-020-010@2x.png) | **Reminder List** <br/><br/> 앱의 메인 화면에는 사용자의 미리 알림이 표시됩니다. 화면 최상단의 Segmented Control은 미리 알림을 due date를 기준으로 today, future, all의 3가지 카테고리로 분류합니다. 사용자는 원형 버튼을 탭 하여 미리 알림을 완료할 수 있고, 진행률 원형(목록 위의 큰 원)을 애니메이션으로 보여줍니다. 툴바의 추가(+) 버튼을 탭하여 새로운 미리 알림을 만듭니다. |
| ![](https://docs-assets.developer.apple.com/published/4adcfe78bae3dbab1a56a996669f33ad/600/UIK_000-020-020@2x.png) | **Reminder Detail and Edit** <br/><br/> Detail 화면은 미리 알림의 제목, 만료일, 만료시간, 추가 노트를 포함하는 부가 정보를 보여줍니다. 사용자는 Edit 버튼을 눌러 미리 알림의 디테일을 변경할 수 있으며, 미리 알림의 셀을 시각적으로 구분되어 표시하여 사용자가 보기 모드인지 편집 모드인지 알 수 있습니다. 보기 모드에서는 미리 알림의 디테일이 하나의 그룹 안에 아이콘과 함께 행별로 표시됩니다. 편집 모드에서는 미리 알림의 디테일이 개별 카테고리로 표시됩니다. 편집 모드의 view는 New Reminder 화면을 표시에 재사용 할 수 있습니다. |
| ![](https://docs-assets.developer.apple.com/published/9195e8ac74804c14ae27d3a120e3afe1/600/UIK_000-020-030@2x.png) | **New Reminder** <br/><br/> Reminder List에서 사용자가 추가(+) 버튼을 탭 하면 New Reminder 화면이 보입니다. 이 화면은 Edit Reminder 화면과 셀을 공유하지만, Edit 화면처럼 네비게이션 스택에 푸시 하지 않고, 모달로 띄웁니다.

## Tips for Success

- 직접 해보는게 최고의 학습입니다. 각 튜토리얼은 start와 completed 프로젝트를 포함합니다. starter 프로젝트를 열고 튜토리얼의 각 스텝을 완료하세요.
- 적극적으로 학습하세요. 코드의 변경사항을 보기 전에 각 스텝에 주어진 작업을 읽고, 어떻게 완료해야 할지 생각해 보세요.
- Xcode 최신 버전을 설치해야 합니다.

## Building the App

이제 UIKit에 대해 자세히 알아보고 Today 앱을 미리 살펴보았으니, 앱 만들어 봅니다. 언제든 막힐때면, 코드 변경을 확인하거나, 완료된 프로젝트를 다운로드받아서 확인합니다. Xcode, Swift, UIKit에 대한 배경지식을 더 알고 싶다면 Apple Books에서 [Develop in Swift Fundamentals](https://books.apple.com/us/book/develop-in-swift-fundamentals/id1511184145)를 다운로드할 수 있습니다.
