# [공식문서로 Swift 배우기] A Swift Tour - 2. Control Flow

- 공식 자료로 학습한 내용을 스스로 참고하기 위해 정리했습니다.
- 오역이나 잘못된 정보가 있을 수 있으므로 원문을 참고하시길 추천합니다.
- 원문: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub Repository에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)


## Control Flow

`if`와 `switch`로 조건문 만들고, `for-in`, `while`, `repeat-while`로 반복문을 만든다. 조건이나 반복문의 변수를 감싸는 소괄호는 선택사항이다. 바디를 감싸는 중괄호는 필수다.

~~~swift
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)    // 11

// 조건과 반복문의 변수를 감싸는 소괄호는 선택사항이므로 가독성이 좋아지는 경우 사용하면 될 것 같다.
for (score) in individualScores {
    if (score > 50) {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
~~~

`if`문에서 조건부는 `Boolean`으로 표현해야 한다. 이 말은 `if score { ... }` 코드가 암시적으로 0과 비교하는 것이 아니라 에러임을 의미한다.

`if`와 `let`을 같이 사용해서 누락될 수 있는 값을 처리할 수 있다. 이 값들은 옵셔널로 표현된다. 옵셔널 값은 `값` 또는 값이 없다는 의미의 `nil`을 포함한다. 값의 타입 뒤에 물음표(`?`)를 작성해서 값이 옵셔널임을 표시한다.

~~~swift
var optionalString: String? = "Hello"
print(optionalString == nil)
// false

var optionalName: String? = "John Appleseed"
print(optionalName)
// Optional("John Appleseed")

var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
// Hello, John Appleseed
~~~

> EXPERIMENT  
> `optionalName`을 nil로 바꿔보자. 어떤 인사말이 되는가? `else`를 추가해서 `optionalName`이 `nil` 일 때 다른 인사말을 하도록 해보자.

~~~swift
greeting = "Hello!"
optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, what's your name?"
}
print(greeting)
// Hello, what's your name?
~~~

옵셔널 값이 `nil`이면, 조건문은 `false`이고 해당 코드는 건너뛴다. `nil`이 아니라면 옵셔널 값은 언랩핑되어 `let` 뒤의 상수에 할당되고, 언랩핑된 값은 코드 블록 안에서 사용할 수 있다.

옵셔널 값을 처리하는 또 다른 방법은 `??`연산자를 사용해서 기본값을 제공하는 것이다. 옵셔널 값이 `nil`이라면, 기본값이 사용된다.

~~~swift
let nickname: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)
// Hi John Applessed
~~~

`Switch`문은 모든 종류의 데이터와 다양한 비교 작업을 지원하며, 정수형과 동등 비교 작업으로만 제한하지 않는다.

~~~swift
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Is it a spicy red pepper?
~~~

> EXPERIMENT  
> default case를 지워보자. 무슨 에러가 발생하는가?

~~~swift
// Switch must be exhaustive
~~~

패턴과 일치하는 상수값을 할당하기 위해서 어떻게 `let`을 사용하는지 확인하라.

일치된 `switch case`에서 빠져나온 후, 프로그램은 `switch`문을 종료한다. 다음 `case`로 이어지지 않으므로 명시적으로 `switch`문의 모든 `case`마다 `break`를 작성하지 않아도 된다.

`for-in`을 사용하여 각 key-value 쌍으로 사용할 이름을 제공하여 딕셔너리의 `item`을 반복할 수 있다.

~~~swift
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// 25
~~~

> EXPERIMENT  
> `_`를 변수 이름으로 바꿔 보자.

~~~swift
largest = 0
var keyOfLargest = ""
for (key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            keyOfLargest = key
        }
    }
}
print("\(largest) in \(keyOfLargest)")
// 25 in Square
~~~

조건이 바뀔 때까지 코드가 반복되도록 `while`을 사용하라. 조건이 반복문 마지막일 수 있으므로 반복문을 최소한 한번 실행 되도록 한다.

~~~swift
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// 128

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// 128
~~~

`..<`를 사용하여 인덱스 범위를 만들어 사용할 수 있다.
~~~swift
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// 6
~~~

상위값을 포함하지 않는 범위를 만들려면 `..<`를 사용하고, 포함하려면 `...`를 사용한다.

~~~swift
total = 0
for i in 0...4 {
    total += i
}
print(total)
// 10
~~~
