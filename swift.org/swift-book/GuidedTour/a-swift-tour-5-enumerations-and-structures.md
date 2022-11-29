# Enumerations and Structures

[`원문`](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html#ID465)

## 열거형

- 열거형을 만들기 위해 `enum`을 사용한다.
- 열거형은 메서드를 가질 수 있다.
- 원시값
    - Swift는 기본적으로 열거형의 원시값들을 0부터 시작해서 1씩 증가하는 값을 할당한다. 이는 명시적으로 값을 할당해서 변경할 수 있다.
    - 원시값에는 문자열이나 부동소수점도 사용할 수 있다.
    - 열거형 케이스의 원시값에 접근하기 위해 `rawValue` 프로퍼티를 사용한다.

~~~swift
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print("\(ace) raw value: \(ace.rawValue)")
// ace raw value: 1
~~~

## 열거형 인스턴스 생성하기

- 원시값으로 열거형의 인스턴스를 만들기 위해 `init?(rawValue:)`를 사용한다.
- rawValue와 일치하는 열거형 케이스를 반환하고, 일치하지 않다면 `nil`을 반환한다.

~~~swift
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}
// 3
~~~

## 열거형의 원시값은 생략할 수 있다.

- 열거형의 케이스 값은 실제 값이다. 원시값을 적는 또 다른 방법이 아니다.
- 의미 없는 원시값은 사용하지 않아도 된다.

~~~swift
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDesriptions() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case.diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
print(hearts)
// hearts
let heartsDescriptions = hearts.simpleDesriptions()
print(heartsDescriptions)
// hearts
let heartsColor = Suit.hearts.color()
print(heartsColor)
// red
~~~

## 열거형 케이스의 연관된 값

- 연관된 값은 열거형 케이스 인스턴스에 저장된 프로퍼티처럼 동작한다.
- 연관된 값은 인스턴스를 생성할 때 결정된다.

~~~swift
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}
// Sunrise is at 6:00 am and sunset is at 8:09 pm.
~~~

## 구조체

- 구조체를 만들기 위해 `struct`를 사용한다.
- 구조체는 클래스와 많은 기능이 동일하다.
- 클래스와 가장 중요한 차이점은 구조체는 값을 복사해서 전달하고, 클래스는 참조로 전달한다는 것이다.

~~~swift
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDesriptions())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescriptions = threeOfSpades.simpleDescription()
print(threeOfSpadesDescriptions)
// The 3 of spades
~~~