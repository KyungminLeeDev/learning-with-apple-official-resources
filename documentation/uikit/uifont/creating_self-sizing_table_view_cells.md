- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > UIKit > UIFont > [Creating Self-Sizing Table View Cells](https://developer.apple.com/documentation/uikit/uifont/creating_self-sizing_table_view_cells)
- [Sample Code Project](./CreatingSelfSizingTableViewCells)

<br/><br/><br/>

# Creating Self-Sizing Table View Cells

다이나믹 타입을 지원하는 테이블 뷰를 만들고 시스템 spacing constraint를 사용하여 텍스트 레이블 주변의 spacing을 조정합니다.

## Overview

이 샘플 코드 프로젝트는 다이나믹 타입을 지원하는 셀프 사이징 테이블 뷰 셀 을 만드는 방법을 보여줍니다. 다이나믹 타입은 유저가 셀에 표시된 텍스트의 크기를 조절할 수 있게하므로, 텍스트 크기 따라 해당 셀의 크기를 다시 조정되는 것이 중요합니다.  
  
또한 이 프로젝트는 오토 레이아웃 constraint를 사용하여 텍스트 크기에 따라 텍스트 레이블 주위의 spacing을 자동으로 조정하는 방법을 보여줍니다. 자동 spacing을 설명하기 위해, 셀은 headline 레이블과 body 레이블이라는 두 UIFont 오브젝트를 표시합니다.

## Add Dynamic Type Support

다이나믹 타입을 지원하기 위해, 셀은 각 레이블에 scaled 폰트를 할당합니다. headlineLabel에는 headine 텍스트 스타일의 preferred 폰트가 사용됩니다. preferred 폰트는 시스템 폰트로, 다양한 크기로 변경될 수 있습니다. 이것의 초기 텍스트 크기는 headline 텍스 스타일의 폰트 metric에 따라 결정됩니다.

~~~swift
headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
headlineLabel.adjustsFontForContentSizeCategory = true
~~~

body label에는 커스텀 폰트를 사용합니다. 커스텀 폰트에 다이나믹 타입을 지원하려면, 텍스트 스타일의 폰트 metric을 포함하는 폰트의 버전이 반드시 생성돼있어야 합니다. body label의 경우엔 body 텍스트 스타일로 Palatino 커스텀 폰트가 사용되었습니다.

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

다이나믹 타입의 효과를 보려면 각 레이블의 `adjustsFontForContentSizeCategory` 프로퍼티를 true로 설정해야 합니다. 이 프로퍼티는 유저가 preferred 텍스트 크기를 변경할 때 폰트에 대한 텍스트 크기를 자동으로 조절하도록 레이블에 알려줍니다. 더 많은 정보를 보려면 [Scailing Fonts Automatically](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically)를 보세요.

## Use Auto Layout Constraints to Adjust Cell Size and Spacing

이 지점에서, 두 레이블은 텍스트 크기를 자동으로 조절하도록 허용했습니다. 하지만 셀은 자신의 크기를 조절하도록 허용되지 않았습니다. 오토 레이아웃 constraint는 셀의 contentView와 여기에 포함된 레이블의 크기와 간격을 조정하기위해 필요합니다.

## Set the Horizontal Position for Each Label

두 레이블의 너비는 셀의 content view의 너비에 채워지게 확장될 수 있어야 합니다. 그리고 headline 레이블은 body 레이블의 위에 보여야 합니다. 이것을 완성하기 위해, 각 레이블에 너비를 정의하는 오토 레이아웃 constraint가 추가됩니다. headline 레이블에는 content view의 leading과 trailing 마진 사이의 공간을 채우는 contraint가 추가됩니다. body 레이블에는 headline 레이블의 leading과 trailing 앵커와 동일한 leading과 trailing 앵커를 설정하는 constraint가 추가됩니다.

~~~swift
headlineLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
headlineLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true

bodyLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor).isActive = true
bodyLabel.trailingAnchor.constraint(equalTo: headlineLabel.trailingAnchor).isActive = true
~~~

body 레이블의 leading과 trailing 앵커를 healine 레이블과 같게 설정하면, 각 레이블의 왼쪽과 오른쪽 엣지가 항상 같은 곳에 위치하게 합니다. headline 레이블의 왼쪽 또는 오른쪽 엣지를 조정하면 변경사항이 body 레이블에 자동으로 적용되는 추가 장점이 있습니다. 이것은 오직 두 개의 레이블에서는 사소하게 보일지라도, 더 많은 레이블의 엣지를 정렬해야 할 때 당신의 시간을 절약할 수 있습니다.

## Set the Vertical Position for Each Label

수평 위치가 자리잡았으니 이제 각 레이블의 수직 위치를 설정할 때 입니다. 오토 레이아웃 constraint가 수직 정렬 위치에 다시 한번 사용됩니다. body 텍스트 위에 headline 텍스트를 위치시킵니다.  
  
수직 위치를 설정하는 한 방법은 두 레이블 간의 거리를 상수 값으로 정의하는 constraint를 추가하는 것입니다. 하지만 상수 값에 의존하는 것의 문제는 텍스트 사이즈가 변경될 때마다 상수 값을 조정해야 한다는 것입니다. 조정하지 않으면 텍스트가 산발적이거나 좁게 보여 읽기 어렵게 될 수 있습니다. iOS 11 이상에서는 system spacing constraint를 사용하여 상수 값에 의존하거나 상수 값을 설정하지 않도록 할 수 있습니다.  
  
system spacing constraint는 constraint를 만들 때 사용되는 앵커에서 제공하는 정보를 기반으로 두 UI 요소 사이의 거리를 값으로 설정합니다. 예를들어, system spacing constraint는 레이블의 firstBaseLineAnchor(레이블의 최상단 텍스트의 베이스라인)를 다른 레이블의 lastBaseLineAnchor(레이블의 최하단 텍스트의 베이스라인) 아래에 시스템이 정의한 거리로 위치시킬 수 있습니다. 이 constraint는 상수 값을 조정하지 않고 텍스트크기에 관계없이 항상 두 레이블 사이에 충분한 간격을 적용합니다.  
  
샘플 코드 프로젝트에서 셀은 system spacing constraint를 다음과 같이 사용합니다.

1. 셀 content view의 top과 headline 레이블 사이의 거리를 설정합니다.
2. body 레이블과 cell의 content view의 bottom 사이의 거리를 설정합니다.
3. headline과 body 레이블 사이의 거리를 설정합니다.

~~~swift
headlineLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true

contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: bodyLabel.lastBaselineAnchor, multiplier: 1).isActive = true

bodyLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.lastBaselineAnchor, multiplier: 1).isActive = true
~~~

system spacing constraint가 적용되면 시스템이 텍스트 사이즈에 기반하여 두 레이블 사이의 거리를 자동으로 조정합니다.

## Test with Accessibility Inspector

샘플 앱이 다양한 텍스트 크기에 어떻게 반응하는지 테스트하려면, 시뮬레이터로 앱을 실행하고 Accessibility Inspector를 사용하여 텍스트 크기를 변경합니다. Inspector는 앱과 설정 앱 사이를 번갈아가며 이동하지 않고 다양한 텍스트 크기를 테스트할 수 있게 합니다.  
  
Accessibility Inspector를 사용하려면 다음 스텝을 따르세요.

1. Xcode를 켜고 앱을 실행합니다.
2. Xcode 메뉴 바에서 Xcode > Open Developer Tool > Accessibility Inspector를 선택하여 실행합니다.
3. Accessibility Inspector의 좌상단에서 타겟을 시뮬레이터로 선택합니다.
4. 설정 아이콘을 클릭합니다.
5. 폰트 크기 슬라이더를 움직여 앱에 표시된 텍스트 크기를 변경합니다.

