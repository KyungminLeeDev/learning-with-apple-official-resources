//: ## Control Flow
//:
//: ## 조건문과 반복문
//:
//: - `if`와 `switch`로 조건문을 만든다.
//: - `for-in`, `while`, `repeat-while`로 반복문을 만든다.
//: - 조건이나 반복문의 변수를 감싸는 소괄호는 선택사항이다.
//: - 바디를 감싸는 중괄호는 필수다.
//: - `if`문에서 조건부는 `Boolean`으로 표현해야 한다.
//:
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



//: ## 옵셔널 값
//:
//: - `if`와 `let`을 같이 사용해서 누락될 수 있는 값(옵셔널 값)을 처리할 수 있다.
//: - 옵셔널 값은 `값` 또는 값이 없다는 의미의 `nil`을 포함한다.
//: - 값의 타입 뒤에 물음표(`?`)를 붙여 값이 옵셔널임을 표시한다.
//:
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

//: > `optionalName`이 `nil` 일 때 다른 인사말 하기
//: > 옵셔널 값이 `nil`이면, 조건문은 `false`이고 해당 코드는 건너뛴다. `nil`이 아니라면 옵셔널 값은 언랩핑되어 `let` 뒤의 상수에 할당되고, 언랩핑된 값은 코드 블록 안에서 사용할 수 있다.
//:
greeting = "Hello!"
optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, what's your name?"
}
print(greeting)
// Hello, what's your name?



//: ## 옵셔널 기본값
//:
//: - `??`연산자를 사용해서 기본값을 제공할 수 있다.
//: - 옵셔널 값이 `nil`이라면, 기본값이 사용된다.
//:
let nickname: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)
// Hi John Applessed



//: ## `Switch`문
//:
//: - `Switch`문은 정수형뿐만 아니라 모든 종류의 데이터와 다양한 비교 작업을 지원한다.
//: - 패턴 일치하는 상수값을 할당하기 위해서 `let`을 활용할 수 있다.
//: - 일치된 switch `case`에서 빠져나온 후 `switch`문은 종료되므로, 모든 `case`마다 `break`를 작성하지 않아도 된다.
//:
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

//: > default case를 지우면 아래 에러가 발생한다.
//:
// Switch must be exhaustive



//: ## 딕셔너리의 요소 반복
//:
//: - `for-in`을 사용하여 각 key-value 쌍으로 사용할 이름을 제공하여 딕셔너리의 `item`을 반복할 수 있다.
//:
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

//: > `_`를 `key`로 변경해서 사용해보기
//:
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



//: ## `while`문
//:
//: - 조건이 바뀔 때까지 코드를 반복하려면 `while`을 사용한다.
//: - 반복문의 조건이 조건이 루프의 마지막일 수 있으므로 반복문을 최소한 한번 실행 되도록 한다.
//:
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



//: ## 인덱스 범위 만들기
//:
//: - `..<`를 사용하여 인덱스 범위를 만들어 사용할 수 있다.
//: - 상위 값을 포함하지 않는 범위를 만들려면 `..<`를 사용하고, 포함하려면 `...`를 사용한다.
//: `..<`를 사용하여 인덱스 범위를 만들어 사용할 수 있다.
//:
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// 6

total = 0
for i in 0...4 {
    total += i
}
print(total)
// 10



//: [Previous](@previous) | [Next](@next)
