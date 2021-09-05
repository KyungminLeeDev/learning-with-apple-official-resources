# [공식문서로 iOS 배우기] Swift

- [GitHub Repository](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)
- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > [Swift](https://developer.apple.com/documentation/swift)

<br/><br/><br/>



# Foundation

강력한 오픈 언어를 사용하여 앱을 구성합니다.

## Overview

Swift는 추론, 옵셔널, 클로저와 같은 최신 기능을 포함하며, 이것은 문법을 간결하면서도 표현적으로 만듭니다. Swift는 당신의 코드가 빠르고 효율적이게 보장하는 동시에 메모리 안전과 네이티브 에러 처리는 언어를 설계적으로 안전하게 합니다. Swift 플레이그라운드, Xcode의 플레이그라운드, REPL에서 하는 Swift 코드 작성은 인터랙티브하고 재밌습니다.

~~~swift
var interestingNumbers = [
    "primes": [2, 3, 5, 7, 11, 13, 17],
    "triangular": [1, 3, 6, 10, 15, 21, 28],
    "hexagonal": [1, 6, 15, 28, 45, 66, 91]
]

for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}

print(interestingNumbers["primes"]!)
// Prints "[17, 13, 11, 7, 5, 3, 2]"
~~~

## Learn Swift

Swift가 처음이라면, [The Swift Programming Language](https://docs.swift.org/swift-book/)의 tour, language guide, language reference를 읽으세요. 프로그래밍이 처음이라면 iPad에서 Swift Playgrounds를 살펴보세요.  
  
Swift는 오픈되어 개발되었습니다. 오픈소스 Swift 프로젝트와 커뮤니티를 알아보려면 [Swift.org](https://swift.org/)에 방문하세요.
