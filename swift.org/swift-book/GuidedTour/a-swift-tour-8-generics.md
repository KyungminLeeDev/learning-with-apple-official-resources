# Generics

[`원문`](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html#ID624)

## 제네릭 함수, 타입 만들기

- 꺾쇠 괄호(`<...>`) 안에 이름을 적어서 제네릭 함수 또는 타입을 만든다.

~~~swift
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
var stringArray = makeArray(repeating: "knock", numberOfTimes: 4)
print(stringArray)
// ["knock", "knock", "knock", "knock"]

var intArray = makeArray(repeating: 1, numberOfTimes: 3)
print(intArray)
// [1, 1, 1]
~~~

## 제네릭 형식으로 만들 수 있는 것

- 제네릭 형식의 함수, 메서드, 클래스, 열거형, 구조체를 만들 수 있다.

~~~swift
// Swift 표준 라이브러리의 옵셔널 타입 재구현
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
print(possibleInteger)
// some(100)

var optionalInt: Int? = 100
print(optionalInt)
// Optional(100)
~~~

## 요구 사항 리스트

- 요구 사항 리스트를 지정하려면 바디 이전에 `where`를 사용한다.
- 사용 예
    - 타입이 프로토콜을 구현하도록 요구
    - 두 타입이 동일하도록 요구
    - 클래스가 특정 상위 클래스를 가지도록 요구
- `<T: Equatable>`은 `<T> ... where T: Equatable`와 동일하다.

~~~swift
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
var isCommon = anyCommonElements([1, 2, 3,], [3])
print(isCommon)
// true
~~~
