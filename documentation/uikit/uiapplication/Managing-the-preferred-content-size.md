# UIApplication / Managing the preferred content size

`Topic`

- var [preferredContentSizeCategory](#preferredContentSizeCategory): UIContentSizeCategory 
- struct [UIContentSizeCategory](#uicontentsizecategory)
- protocol [UIContentSizeCategoryAdjusting](#uicontentsizecategoryadjusting)
- static let [didChangeNotification](#didChangeNotification): NSNotification.Name
- static let [newValueUserInfoKey](#newValueUserInfoKey): String

<br>

## [preferredContentSizeCategory](https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory)

`Instance Property`

The font sizing option preferred by the user.

> 사용자가 선호하는 폰트 크기 옵션.

### Discussion

Users can request that apps display fonts in a size that is larger or smaller than the normal font size defined by the system. For example, a user with a visual impairment might request a larger default font size to make it easier to read text. Font objects returned by the system automatically scale based on the user’s preference. You can use the value of this property to request a font object of the appropriate size.

> 사용자는 앱이 표시하는 폰트 크기를 시스템이 정의한 보통 폰트 크기 보다 크거나 작게 표시되게 요청할 수 있습니다. 예를 들어, 시각 장애가 있는 사용자는 텍스트를 읽기 쉽게 하려고 더 큰 기본 폰트 크기를 요청할 수 있습니다. 시스템이 반환하는 폰트 오브젝트는 사용자의 설정에 따라 자동으로 배율이 변경됩니다. 이 프로퍼티의 값을 사용하여 적절한 크기의 폰트 오브젝트를 요청할 수 있습니다.  

<br>

When the value of this property changes, the app object sends a [`didChangeNotification`](https://developer.apple.com/documentation/uikit/uicontentsizecategory/1622948-didchangenotification) notification so that observers can respond accordingly.

> 이 프로퍼티의 값이 변경될 때, 앱 오브젝트는 `didChangeNotification` 노티피케이션을 발송하므로 옵저버가 그에 맞게 반응할 수 있습니다.  

<br>

For a list of possible values, see Content Size Category Constants and Accessibility Content Size Category Constants.

> 사용 가능한 값의 리스트는 Content Size Category Constants와 Accessibility Content Size Category Constants를 보세요.

<br><br><br>



## [UIContentSizeCategory](https://developer.apple.com/documentation/uikit/uicontentsizecategory)

`Structure`

Constants that indicate the preferred size of your content.

> 컨텐츠의 기본 크기를 나타내는 상수

<br><br><br>



## [UIContentSizeCategoryAdjusting](https://developer.apple.com/documentation/uikit/uicontentsizecategoryadjusting)

`Protocol`

A collection of methods that give controls an easy way to adopt automatic adjustment to content category changes.

> 컨텐츠 카테고리 변경사항에 자동 조정 적용을 쉽게 하기 위한 컨트롤을 제공하는 메서드의 모음입니다.

<br><br><br>



## [didChangeNotification](https://developer.apple.com/documentation/uikit/uicontentsizecategory/1622948-didchangenotification)

`Type Property`

A notification that posts when the user changes the preferred content size setting.

> 유저가 컨텐츠 기본 크기 설정을 변경했을 때 발신되는 알림

### Discussion

This notification is sent when the value in the [`preferredContentSizeCategory`](https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory) property changes. The userInfo dictionary of the notification contains the [`newValueUserInfoKey`](https://developer.apple.com/documentation/uikit/uicontentsizecategory/1623012-newvalueuserinfokey) key, which reflects the new setting.

> 이 알림은 `preferredContentSizeCategory` 프로퍼티 값이 변경될 때 발송됩니다. 알림의 userinfo 딕셔너리는 새 설정값을 나타내는 `newValueUserInfoKey` 키를 포함합니다.

<br><br><br>



## [newValueUserInfoKey](https://developer.apple.com/documentation/uikit/uicontentsizecategory/1623012-newvalueuserinfokey)

`Type Property`

A key that reflects the new preferred content size.

> 새로운 컨텐츠 기본 크기를 나타내는 키.

### Discussion

This key’s value is an [`NSString`](https://developer.apple.com/documentation/foundation/nsstring) object that reflects the new value of the [`preferredContentSizeCategory`](https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory) property.

> 이 키값은 `preferredContentSizeCategory`프로퍼티의 새 값을 나타내는 `NSString` 오브젝트입니다.
