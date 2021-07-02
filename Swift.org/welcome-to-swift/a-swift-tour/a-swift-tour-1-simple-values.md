# [공식문서로 Swift 배우기] A Swift Tour - 1. Simple Values

- 공식 자료로 학습한 내용을 스스로 참고하기 위해 정리했으며, 번역이 목표가 아니므로 오역이나 잘못된 정보가 있을 수 있습니다.
- 원본: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub Repository에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

# A Swift Tour

Swift는 코드 한 줄로 `Hello, world!`를 출력할 수 있다.

~~~swift
print("Hello, world!")
~~~

이 한 줄의 코드가 완전한 프로그램이다. 전역으로 작성된 코드는 프로그램의 시작점이므로 main() 함수가 필요 없다. 코드의 끝마다 세미콜론(`;`)을 붙일 필요가 없다.


## Simple Values

상수는 `let`, 변수는 `var`로 만든다. 상수는 컴파일 시에 알 필요는 없지만 반드시 한 번은 값을 할당 해야 하며, 한번의 상수 값 확정으로 여러 곳에서 사용할 수 있다는 의미다.

~~~swift
var myVariable = 42
myVariable = 50     // 변수는 값 변경 가능
let myConstant = 42
//myConstant = 50   // 상수는 값 변경 불가능
~~~

상수 또는 변수는 할당하려는 값과 동일한 타입이어야 한다. 그러나 항상 명시적으로 타입을 작성할 필요는 없다. 상수 또는 변수를 만들며 값을 넣을 때 컴파일러가 타입을 추론한다. 위의 예시에서, `myVariable`의 초기값이 정수기 때문에 컴파일러는 정수 타입으로 추론한다. 

만약 초기값이 충분한 정보를 제공하지 않거나 없다면, 변수 뒤에 콜론(`:`)으로 구분하여 타입을 지정해야 한다.

~~~swift
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
print(implicitInteger)  // 70
print(implicitDouble)   // 70.0
print(explicitDouble)   // 70.0
~~~

> EXPERIMENT  
> 명시적 Float 타입이고 값이 4인 상수를 만들어 보자.
~~~swift
let explicitFloat: Float = 4
print(explicitFloat)    // 4.0
~~~

값은 절대 암시적으로 다른 타입으로 변경될 수 없다. 만약 값을 다른 타입으로 변경해야 한다면, 명시적으로 원하는 타입의 인스턴스로 만들어야 한다.

~~~swift
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel) // The width is 94
~~~

> EXPERIMENT  
> 마지막 줄의 String을 지우고 무슨 에러가 발생하는지 확인해보자.

~~~swift
let widthLabel2 = label + width
// Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
~~~

문자열에 값을 넣는 더 간단한 방법이 있다.: 소괄호 안에 값을 작성하고 백슬래쉬를(`\`)를 소괄호 앞에 적어라. 예를 들면: 

~~~swift
let apples = 3
let oranges = 5
let appleSumarry = "I have \(apples) apples."
let fruitSumarry = "I have \(apples + oranges) pieces of fruit."
~~~

> EXPERIMENT  
> `\()`를 사용하여 문자열에 부동소수점 계산을 넣고, 인사말에 이름을 추가해 넣어라.

~~~swift
let hi = "Hi. I'm Jacob. The number is \(1.5 * 2)"
~~~

3개의 쌍따옴표(`"""`)를 두 번 사용하여 여러 줄의 문자열을 처리한다.

~~~swift
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) peices of fruit."
"""
~~~

대괄호(`[]`)를 사용해서 배열과 딕셔너리를 만들고, 대괄호 안에 `index`나 `key`를 넣어 해당 요소에 접근한다. 마지막 요소 다음에 콤마(`,`)도 허용된다.

~~~swift
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water" // index로 접근

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic", // 마지막 요소 뒤에 콤마 허용
]
occupations["Jayne"] = "Public Relations" // key로 접근
~~~

배열은 요소를 추가하면 자동으로 크기가 늘어난다.

~~~swift
shoppingList.append("blue paint")
print(shoppingList)
// ["catfish", "bottle of water", "tulips", "blue paint"]
~~~

빈 배열 또는 딕셔너리를 만들려면 초기화 구문을 사용한다.

~~~swift
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
~~~

타입을 추론할 수 있다면 빈 배열을 `[]`로, 빈 딕셔너리를 `[:]`로 작성할 수 있다. 예를 들어 변수에 새로운 값을 지정하거나, 함수에 인자를 전달할 때 사용한다.

~~~swift
shoppingList = []
occupations = [:]
~~~