`Sample Code`

# [Creating Self-Sizing Table View Cells](https://developer.apple.com/documentation/uikit/uifont/creating_self-sizing_table_view_cells)

Create table view cells that support Dynamic Type and use system spacing constraints to adjust the spacing surrounding text labels.

> 다이나믹 타입을 지원하는 테이블 뷰를 만들고 system spacing constraint를 사용하여 텍스트 레이블 주변의 spacing을 조정합니다.

<br>

[`Sample Code Project`](./CreatingSelfSizingTableViewCells)

<br>

## Overview

This sample code project shows how to create self-sizing table view cells that support Dynamic Type. Because Dynamic Type lets the user control the size of the text displayed in the cell, it’s important that the cell resizes itself based on the text size.

> 이 샘플 코드 프로젝트는 다이나믹 타입을 지원하는 셀프 사이징 테이블 뷰 셀 을 만드는 방법을 보여줍니다. 다이나믹 타입은 유저가 셀에 표시된 텍스트의 크기를 조절할 수 있게 하므로, 텍스트 크기 따라 해당 셀의 크기가 다시 조정되는 것이 중요합니다.  

<br>

The project also shows how to use Auto Layout constraints to automatically adjust the spacing surrounding text labels based on the text size. To demonstrate automatic spacing, the cell displays two [`UIFont`](https://developer.apple.com/documentation/uikit/uifont) objects: a headline label and a body label.
  
> 또한 이 프로젝트는 오토 레이아웃 constraint를 사용하여 텍스트 크기에 따라 텍스트 레이블 주위의 spacing을 자동으로 조정하는 방법을 보여줍니다. 자동 spacing을 설명하기 위해, 셀은 headline 레이블과 body 레이블이라는 두 `UIFont` 오브젝트를 표시합니다.

<br>

## Add Dynamic Type Support

To add support for Dynamic Type, the cell assigns a scaled font to each label. For the headline label, the preferred font with the [`headline`](https://developer.apple.com/documentation/uikit/uifont/textstyle/1616702-headline) text style is used. The preferred font is the system font, which can scale to different sizes. Its initial text size is determined by the font metric for the headline text style.

> 다이나믹 타입을 지원하기 위해, 셀은 각 레이블에 scaled 폰트를 할당합니다. headline 레이블에는 `headline` 텍스트 스타일의 preferred 폰트가 사용됩니다. preferred 폰트는 시스템 폰트로, 다양한 크기로 변경될 수 있습니다. 이것의 초기 텍스트 크기는 headline 텍스트 스타일의 폰트 metric에 따라 결정됩니다.

~~~swift
headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
headlineLabel.adjustsFontForContentSizeCategory = true
~~~

For the body label, a custom font is used. However, in order to support Dynamic Type with a custom font, a version of the font must be created that adopts the font metric for a particular text style. In the case of the body label, the Palatino custom font is used with the [`body`](https://developer.apple.com/documentation/uikit/uifont/textstyle/1616682-body) text style.

> body 레이블에는 커스텀 폰트를 사용합니다. 커스텀 폰트에 다이나믹 타입을 지원하려면, 텍스트 스타일의 폰트 metric을 포함하는 폰트의 버전이 반드시 생성돼있어야 합니다. body 레이블의 경우엔 `body` 텍스트 스타일로 Palatino 커스텀 폰트가 사용되었습니다.

~~~swift
guard let palatino = UIFont(name: "Palatino", size: 18) else {
    fatalError("""
        Failed to load the "Palatino" font.
        Since this font is included with all versions of iOS that support Dynamic Type, verify that the spelling and casing is correct.
        """
    )
}
bodyLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: palatino)
bodyLabel.adjustsFontForContentSizeCategory = true
~~~

Before the effects of Dynamic Type can be seen, the [`adjustsFontForContentSizeCategory`](https://developer.apple.com/documentation/uikit/uicontentsizecategoryadjusting/1771731-adjustsfontforcontentsizecategor) property must be set to true on each label. This property tells the label to automatically adjust the text size for its font when the user changes their preferred text size. For more information, see [`Scaling Fonts Automatically`](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically).

> 다이나믹 타입의 효과를 보려면 각 레이블의 `adjustsFontForContentSizeCategory` 프로퍼티를 true로 설정해야 합니다. 이 프로퍼티는 유저가 preferred 텍스트 크기를 변경할 때 폰트에 대한 텍스트 크기를 자동으로 조절하도록 레이블에 알려줍니다. 더 많은 정보를 보려면 `Scailing Fonts Automatically`를 보세요.

<br>

## Use Auto Layout Constraints to Adjust Cell Size and Spacing

At this point, the two labels are able to adjust the size of their text automatically. However, the cell isn’t able to adjust its size. Auto Layout constraints are needed to adjust the size and spacing of the cell’s [`contentView`](https://developer.apple.com/documentation/uikit/uitableviewcell/1623229-contentview) and the labels it contains.

> 이 지점에서, 두 레이블은 텍스트 크기를 자동으로 조절하도록 허용했습니다. 하지만 셀은 자신의 크기를 조절하도록 허용되지 않았습니다. 오토 레이아웃 constraint는 셀의 `contentView`와 여기에 포함된 레이블의 크기와 간격을 조정하기 위해 필요합니다.

<br>

## Set the Horizontal Position for Each Label

The width of both labels should extend to fill the width of the cell’s content view, and the headline label should appear above the body label. To accomplish this, Auto Layout constraints are added to each label starting with constraints that define the label width. For the headline label, constraints are added that tell the label to fill the space between the content view’s leading and trailing margins. For the body label, constraints are added that set its leading and trailing anchors equal to the headline label’s leading and trailing anchors.

> 두 레이블의 너비는 셀의 content view의 너비에 채워지게 확장될 수 있어야 합니다. 그리고 headline 레이블은 body 레이블의 위에 보여야 합니다. 이것을 완성하기 위해, 각 레이블에 너비를 정의하는 오토 레이아웃 constraint가 추가됩니다. headline 레이블에는 content view의 leading과 trailing 마진 사이의 공간을 채우는 contraint가 추가됩니다. body 레이블에는 headline 레이블의 leading과 trailing 앵커와 동일한 leading과 trailing 앵커를 설정하는 constraint가 추가됩니다.

~~~swift
headlineLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true

bodyLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor).isActive = true
bodyLabel.trailingAnchor.constraint(equalTo: headlineLabel.trailingAnchor).isActive = true
~~~

Setting the body label’s leading and trailing anchors equal to the leading and trailing anchors for the headline label ensures that the left and right edges of each label are always in the same position. This approach has an added benefit; adjusting either the left or right edge on the headline label automatically applies the changes to the body label. While this might seem trivial when there are only two labels, setting a label’s leading and trailing anchors equal to the same anchors of another label can save you time when there are many more labels that must align their edges.

> body 레이블의 leading과 trailing 앵커를 healine 레이블과 같게 설정하면, 각 레이블의 왼쪽과 오른쪽 엣지가 항상 같은 곳에 위치하게 합니다. headline 레이블의 왼쪽 또는 오른쪽 엣지를 조정하면 변경사항이 body 레이블에 자동으로 적용되는 추가 장점이 있습니다. 이것은 오직 두 개의 레이블에서는 사소하게 보일지라도, 더 많은 레이블의 엣지를 정렬해야 할 때 당신의 시간을 절약할 수 있습니다.

<br>

## Set the Vertical Position for Each Label

With the horizontal positioning in place, it’s time to set the vertical position for each label. Auto Layout constraints are once again used to position the vertical alignment, placing the headline text above the body text.

> 수평 위치가 자리 잡았으니 이제 각 레이블의 수직 위치를 설정할 때입니다. 오토 레이아웃 constraint가 수직 정렬 위치에 다시 한번 사용됩니다. body 텍스트 위에 headline 텍스트를 위치시킵니다.  

<br>

One way vertical positioning can be set is to add a constraint that defines the distance between the two labels based on some constant value. However, the problem with relying on a constant value is that you must adjust the value each time the text size changes; otherwise, the text may look scattered or cramped, making it difficult to read. With iOS 11 and later, you can avoid relying on and setting the constant value by using system spacing constraints.

> 수직 위치를 설정하는 한 방법은 두 레이블 간의 거리를 상수 값으로 정의하는 constraint를 추가하는 것입니다. 하지만 상수 값에 의존하는 것의 문제는 텍스트 사이즈가 변경될 때마다 상수 값을 조정해야 한다는 것입니다. 조정하지 않으면 텍스트가 산발적이거나 좁게 보여 읽기 어렵게 될 수 있습니다. iOS 11 이상에서는 system spacing constraint를 사용하여 상수 값에 의존하거나 상수 값을 설정하지 않도록 할 수 있습니다.  

<br>

A system spacing constraint sets the distance between two UI elements to a value based on information provided by the anchors used when creating the constraint. For example, a system spacing constraint can position a label’s [`firstBaselineAnchor`](https://developer.apple.com/documentation/uikit/uiview/1622508-firstbaselineanchor) (the baseline for the topmost text in the label) below another label’s [`lastBaselineAnchor`](https://developer.apple.com/documentation/uikit/uiview/1622471-lastbaselineanchor) (the baseline for the bottommost text in that label) at a distance defined by the system. The constraint ensures that adequate spacing is always applied between the two labels regardless of the text size, without adjusting the constraint’s constant value.

> system spacing constraint는 constraint를 만들 때 사용되는 앵커에서 제공하는 정보를 기반으로 두 UI 요소 사이의 거리를 값으로 설정합니다. 예를 들어, system spacing constraint는 레이블의 `firstBaseLineAnchor` (레이블의 최상단 텍스트의 베이스라인)를 다른 레이블의 `lastBaseLineAnchor` (레이블의 최하단 텍스트의 베이스라인) 아래에 시스템이 정의한 거리로 위치시킬 수 있습니다. 이 constraint는 상수 값을 조정하지 않고 텍스트 크기에 관계없이 항상 두 레이블 사이에 충분한 간격을 적용합니다.

<br>

For the sample code project, the cell uses system spacing constraints to:

1. Set the spacing between the top of the cell’s content view and the headline label.
2. Set the spacing between the body label and the bottom of the cell’s content view.
3. Set the spacing between the headline and body labels.

> 샘플 코드 프로젝트에서 셀은 system spacing constraint를 다음과 같이 사용합니다.
>
> 1. 셀 content view의 top과 headline 레이블 사이의 거리를 설정합니다.
> 2. body 레이블과 cell의 content view의 bottom 사이의 거리를 설정합니다.
> 3. headline과 body 레이블 사이의 거리를 설정합니다.

~~~swift
headlineLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true

contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: bodyLabel.lastBaselineAnchor, multiplier: 1).isActive = true

bodyLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.lastBaselineAnchor, multiplier: 1).isActive = true
~~~

With the system spacing constraints in place, the system automatically adjusts the spacing surrounding the two labels based on the text size.

> system spacing constraint가 적용되면 시스템이 텍스트 사이즈에 기반하여 두 레이블 사이의 거리를 자동으로 조정합니다.

![](https://docs-assets.developer.apple.com/published/065733c25f/1b86ee29-0401-42ab-8373-6b1f19512fbc.png)

<br>

## Test with Accessibility Inspector

In order to test how the sample app reacts to different text sizes, run the app in Simulator and use Accessibility Inspector to change the text size. The inspector lets you test an app’s interface with different text sizes without switching between the app and the Settings app.

> 샘플 앱이 다양한 텍스트 크기에 어떻게 반응하는지 테스트하려면, 시뮬레이터로 앱을 실행하고 Accessibility Inspector를 사용하여 텍스트 크기를 변경합니다. Inspector는 앱과 설정 앱 사이를 번갈아가며 이동하지 않고 다양한 텍스트 크기를 테스트할 수 있게 합니다.  

<br>

To use Accessibility Inspector, follow these steps:

1. Launch Xcode, then run your app.
2. From the Xcode menu bar, select Xcode > Open Developer Tool > Accessibility Inspector to launch the inspector.
3. In the upper left corner of the Accessibility Inspector, select Simulator as the target.
4. Click the Settings icon (shaped like a gear).
5. Move the Font size slider to change the size of text displayed in your app.
  
> Accessibility Inspector를 사용하려면 다음 스텝을 따르세요.
> 
> 1. Xcode를 켜고 앱을 실행합니다.
> 2. Xcode 메뉴 바에서 Xcode > Open Developer Tool > Accessibility Inspector를 선택하여 실행합니다.
> 3. Accessibility Inspector의 좌상단에서 타겟을 시뮬레이터로 선택합니다.
> 4. 설정 아이콘을 클릭합니다.
> 5. 폰트 크기 슬라이더를 움직여 앱에 표시된 텍스트 크기를 변경합니다.

