# [Swift](https://developer.apple.com/documentation/swift)

`Framework`

Build apps using a powerful open language.

> 강력한 오픈 언어를 사용하여 앱을 빌드합니다.

<br>

## Overview

Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.

> 스위프트는 추론, 옵셔널, 클로저와 같은 최신 기능을 포함하며, 이것은 문법을 간결하면서도 표현적으로 만듭니다. 스위프트는 당신의 코드가 빠르고 효율적이게 보장하는 동시에 메모리 안전과 네이티브 에러 처리는 언어를 설계적으로 안전하게 합니다. 스위프트 플레이그라운드, Xcode의 플레이그라운드, REPL에서 하는 스위프트 코드 작성은 인터랙티브하고 재밌습니다.

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

<br>

## Learn Swift

If you’re new to Swift, read [`The Swift Programming Language`](https://docs.swift.org/swift-book/) for a quick tour, a comprehensive language guide, and a full reference manual. If you’re new to programming, check out [`Swift Playgrounds`](https://www.apple.com/swift/playgrounds/) on iPad.

> 스위프트가 처음이라면, `The Swift Programming Language`의 tour, language guide, language reference를 읽으세요. 프로그래밍이 처음이라면 iPad에서 `Swift Playgrounds`를 살펴보세요.  

<br>

Swift is developed in the open. To learn more about the open source Swift project and community, visit [`Swift.org`](https://swift.org/).
  
> 스위프트는 오픈되어 개발되었습니다. 오픈소스 스위프트 프로젝트와 커뮤니티를 알아보려면 `Swift.org`에 방문하세요.
