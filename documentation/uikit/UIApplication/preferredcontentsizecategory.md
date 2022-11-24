`Instance Property`

# [preferredContentSizeCategory](https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory)

The font sizing option preferred by the user.

> 사용자가 선호하는 폰트 크기 옵션.

<br>

## Declaration

~~~swift
var preferredContentSizeCategory: UIContentSizeCategory { get }
~~~

<br>

## Discussion

Users can request that apps display fonts in a size that is larger or smaller than the normal font size defined by the system. For example, a user with a visual impairment might request a larger default font size to make it easier to read text. Font objects returned by the system automatically scale based on the user’s preference. You can use the value of this property to request a font object of the appropriate size.

> 사용자는 앱이 표시하는 폰트 크기를 시스템이 정의한 보통 폰트 크기 보다 크거나 작게 표시되게 요청할 수 있습니다. 예를 들어, 시각 장애가 있는 사용자는 텍스트를 읽기 쉽게 하려고 더 큰 기본 폰트 크기를 요청할 수 있습니다. 시스템이 반환하는 폰트 오브젝트는 사용자의 설정에 따라 자동으로 배율이 변경됩니다. 이 프로퍼티의 값을 사용하여 적절한 크기의 폰트 오브젝트를 요청할 수 있습니다.  

<br>

When the value of this property changes, the app object sends a [`didChangeNotification`](https://developer.apple.com/documentation/uikit/uicontentsizecategory/1622948-didchangenotification) notification so that observers can respond accordingly.

> 이 프로퍼티의 값이 변경될 때, 앱 오브젝트는 `didChangeNotification` 노티피케이션을 발송하므로 옵저버가 그에 맞게 반응할 수 있습니다.  

<br>

For a list of possible values, see Content Size Category Constants and Accessibility Content Size Category Constants.

> 사용 가능한 값의 리스트는 Content Size Category Constants와 Accessibility Content Size Category Constants를 보세요.

