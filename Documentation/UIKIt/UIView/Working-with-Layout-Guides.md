# Working with Layout Guides

- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > UIKit > UIView > Topics > [Working with Layout Guides](https://developer.apple.com/documentation/uikit/uiview)

<br/><br/><br/>

## layoutMarginsGuide

뷰의 마진을 나타내는 레이아웃 가이드입니다.

~~~swift
// Instance Property
var layoutMarginsGuide: UILayoutGuide { get }
~~~

이 레이아웃 가이드의 앵커를 사용하여 뷰의 마진과 constraint를 생성합니다.

## readableContentGuide

뷰 안에 읽기 쉬운 너비의 영역을 나타내는 레이아웃 가이드입니다.

~~~swift
// Instance Property
var readableContentGuide: UILayoutGuide { get }
~~~

이 레이아웃 가이드는 사용자가 글을 읽기 위해 머리를 움직일 필요 없이 읽기 쉽게 해줄 수 있는 영역을 정의합니다. readable content는 아래 규칙을 따릅니다.

1. readable content guide는 뷰의 layout margin guide를 벗어나지 않습니다.
2. readable content guide는 layout margin guide안에서 수직으로 정가운데에 위치합니다.
3. layout margin guide는 현재 dynamic text size에 정의된 readable width와 같거나 작습니다.

readable content guide를 사용하여 텍스트의 단일 열을 배치합니다. 여러 열을 배치해야 한다면, 열들의 적절한 너비를 알기위해 가이드의 너비를 사용할 수 있습니다.

