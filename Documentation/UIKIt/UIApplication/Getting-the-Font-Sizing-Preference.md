# [공식문서로 iOS 배우기] Getting the Font Sizing Preference

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > UIKit > UIApplication > Topics > [Getting the Font Sizing Preference](https://developer.apple.com/documentation/uikit/uiapplication)

<br/><br/><br/>

# Getting the Font Sizing Preference

- var [preferredContentSizeCategory](#preferredContentSizeCategory): UIContentSizeCategory
- struct **UIContentSizeCategory**: 컨텐츠의 선호하는 크기를 나타내는 상수
    - unspecified
    - extraSamll
    - small
    - medium
    - large
    - extraLarge
    - extraExtraLarge
    - extraExtraExtraLarge
    - accessibilityMedium
    - accessibilityLarge
    - accessibilityExtraLarge
    - accessibilityExtraExtraLarge
    - accessibilityExtraExtraExtraLarge
    - isAccessibilityCategory: 컨텐츠 크기 카테고리가 접근성과 관련됐는지 아닌지 나타내는 불 값
- protocol **UIContentSizeCategoryAdjusting**
- static let **didChangeNotification**: NSNotification.Name
    - 사용자가 선호하는 컨텐트 크기 설정을 변경할 때 발송하는 노티피케이션입니다.
    - 이 노티피케이션은 `preferredContentSizeCategory` 프로퍼티의 값이 변경될 때 발송됩니다. 노티피케이션의 딕셔너리 `userInfo`는 새로운 설정을 반환하는 `newValueUserInfoKey` key를 포함합니다.
- static let **newValueUserInfoKey**: String
    - 새 선호하는 컨텐츠 크기를 반영하는 key입니다.
    - 이 key의 값은 preferredContentSizeCategory 프로퍼티의 새 값을 반영하는 NSString 오브젝트입니다.


## preferredContentSizeCategory

사용자가 선호하는 폰트 크기 옵션

### Declaration

~~~swift
var preferredContentSizeCategory: UIContentSizeCategory { get }
~~~

### Discussion

사용자는 앱이 표시하는 폰트 크기를 시스템이 정의한 보통 폰트 크기 보다 크거나 작게 표시되게 요청할 수 있습니다. 예를들어, 시각 장애가 있는 사용자는 텍스트를 읽기 쉽게하려고 더 큰 기본 폰트 크기를 요청할 수 있습니다. 시스템이 반환하는 폰트 오브젝트는 사용자의 설정에 따라 자동으로 배율이 변경됩니다. 이 프로퍼티의 값을 사용하여 적절한 크기의 폰트 오브젝트를 요청할 수 있습니다.  
  
이 프로퍼티의 값이 변경될 때, 앱 오브젝트는 `didChangeNotification` 노티피케이션을 발송하므로 옵저버가 그에 맞게 반응할 수 있습니다.  

