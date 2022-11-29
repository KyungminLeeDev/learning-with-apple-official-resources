# [공식문서로 Swift 배우기] A Swift Tour - 1. Simple Values

- 공식 자료를 학습하고 정리했으며, 잘못된 정보가 있을 수 있습니다.
- 원문: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub Repository에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

# Simple Values

## 상수와 변수

- 상수는 `let`, 변수는 `var`로 만든다.
- 상수는 컴파일 시에 알 필요는 없지만 반드시 한 번은 값을 할당 해야 한다.
- 상수는 한번의 값 확정으로 상수 이름만으로 값을 여러 곳에서 사용할 수 있다.

~~~swift
var myVariable = 42
myVariable = 50     // 변수는 값 변경 가능
let myConstant = 42
//myConstant = 50   // 상수는 값 변경 불가능
~~~

## 컴파일러의 타입 추론

- 상수 또는 변수는 할당하려는 값과 동일한 타입이어야 한다.
- 상수 또는 변수를 만들며 값을 넣을 때 컴파일러가 타입을 추론하므로 항상 명시적으로 타입을 작성팔 필요는 없다.
- 앞의 예제에서 `myVariable`의 초기값이 정수기 때문에 컴파일러는 정수 타입으로 추론한다.
- 초기값이 충분한 정보를 제공하지 않거나 없다면, 변수 뒤에 콜론(`:`)으로 구분하여 타입을 지정해야 한다.

~~~swift
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
print(implicitInteger)  // 70
print(implicitDouble)   // 70.0
print(explicitDouble)   // 70.0
~~~

> 명시적 Float 타입이고 값이 4인 상수 만들기

~~~swift
let explicitFloat: Float = 4
print(explicitFloat)    // 4.0
~~~

## 값의 타입 변경하기

- 값은 암시적으로 다른 타입으로 변경될 수 없다
- 값을 다른 타입으로 변경해야 한다면, 명시적으로 원하는 타입의 인스턴스로 만들어야 한다.

~~~swift
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel) // The width is 94
~~~

> 다른 타입을 연산하려 하면 발생하는 에러

~~~swift
let widthLabel2 = label + width
// Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
~~~

## 문자열에 간단히 값 넣기

- 소괄호 안에 값을 작성하고 백슬래쉬를(`\`)를 소괄호 앞에 적는다. `\(값)`

~~~swift
let apples = 3
let oranges = 5
let appleSumarry = "I have \(apples) apples."
let fruitSumarry = "I have \(apples + oranges) pieces of fruit."
~~~

> `\()`를 사용하여 문자열에 부동소수점 계산을 넣고, 인사말에 이름을 추가하기

~~~swift
let hi = "Hi. I'm Jacob. The number is \(1.5 * 2)"
~~~

## 여러줄의 문자열 처리하기

- 3개의 쌍따옴표(`"""`)를 두 번 사용하여 여러 줄의 문자열을 처리한다.

~~~swift
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) peices of fruit."
"""
~~~

## 배열과 딕셔너리

- 대괄호(`[]`)를 사용해서 배열과 딕셔너리를 만든다.
- 대괄호 안에 `index`나 `key`를 넣어 해당 요소에 접근한다.
- 마지막 요소뒤에 콤마(`,`)도 허용된다.

~~~swift
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water" // index로 접근

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic", // 마지막 요소 뒤에 콤마 허용
]
occupations["Jayne"] = "Public Relations" // key로 접근
~~~

## 배열은 요소를 추가하면 자동으로 크기가 늘어난다

~~~swift
shoppingList.append("blue paint")
print(shoppingList)
// ["catfish", "bottle of water", "tulips", "blue paint"]
~~~

## 빈 배열, 빈 딕셔너리 만들기

- 초기화 구문을 사용하여 빈 배열 또는 딕셔너리를 만든다.

~~~swift
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
~~~

- 타입을 추론할 수 있다면 빈 배열을 `[]`로, 빈 딕셔너리를 `[:]`로 작성할 수 있다.
- 변수에 새로운 값을 지정하거나, 함수에 인자를 전달할 때 사용한다.

~~~swift
shoppingList = []
occupations = [:]
~~~