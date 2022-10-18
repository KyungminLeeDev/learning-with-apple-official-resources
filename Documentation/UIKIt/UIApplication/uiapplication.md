# UIApplication

## Overview

## Topics

### Managing the preferred content size

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
