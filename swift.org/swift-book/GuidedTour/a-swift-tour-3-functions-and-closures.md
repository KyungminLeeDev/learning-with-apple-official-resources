# [공식문서로 Swift 배우기] A Swift Tour - 3. Functions and Closures

- 공식 자료를 학습하고 정리했으며, 잘못된 정보가 있을 수 있습니다.
- 원문: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)


# Functions and Closures

## 함수 선언, 호출

- `func`로 함수 선언한다.
- 함수의 이름과 소괄호 안의 인수 목록으로 함수 호출한다.
- 함수의 반환 타입과 파라미터의 이름 및 타입을 구분하기 위해 `->` 사용한다.

~~~swift
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
var say = greet(person: "Bob", day: "Tuesday")
print(say)
// Hello Bob, today is Tuesday

func greet(person: String, lunchSpecial: String) -> String {
    return "Hello \(person), today's lunch special is \(lunchSpecial)"
}
say = greet(person: "Bob", lunchSpecial: "Chicken")
print(say)
// Hello Bob, today's lunch special is Chicken
~~~

## 함수의 인수 레이블

- 함수는 기본적으로 파라미터 이름을 인수 레이블로 사용한다.
- 커스텀 인수 레이블을 작성하려면, 파라미터 이름 앞에 인수 레이블을 적는다.
- 인수 레이블을 사용하지 않으려면, 파라미터 이름 앞에 `_`를 적는다.

~~~swift
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
say = greet("John", on: "Wednesday")
print(say)
// Hello John, today is Wednesday.
~~~

## 튜플로 여러 값 반환하기

- 튜플을 사용하여 복합적인 값을 만들 수 있다.
- 함수로부터 여러 값을 반환받기 위해 튜플을 사용한다.
- 튜플의 요소는 이름 또는 숫자로 참조할 수 있다.

~~~swift
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// 120
print(statistics.2)
// 120
print(statistics)
// (min: 3, max: 100, sum: 120)
~~~

## 중첩된 함수 (Nested function)

- 함수는 중첩될 수 있다.
- 중첩된 함수는 외부 함수에서 선언된 변수에 접근할 수 있다.
- 중첩된 함수를 사용해서 길거나 복잡한 함수의 코드를 정리할 수 있다.

> 중첩된 함수 사용은 알겠는데, 복잡한 코드를 정리하는 예제는 아닌 듯하다.

~~~swift
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())
// 15
~~~

## 함수는 1급 타입이므로 다른 함수를 값으로 반환할 수 있다

~~~swift
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))
// 8
~~~

## 함수는 다른 함수를 인수로 가질 수 있다

~~~swift
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
let result = hasAnyMatches(list: numbers, condition: lessThanTen)
print(result)
// true
~~~


## 함수는 클로저의 특별한 케이스다

- 함수는 나중에 호출될 수 있는 코드 블럭인 클로저의 특별한 케이스다.
- 코드를 중괄호(`{...}`)로 감싸는 것으로 이름 없이 클로저를 작성할 수 있다.
- `in`을 사용하여 인수와 반환 타입을 바디로부터 분리한다.

~~~swift
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
~~~

## 더 간단하게 클로저 작성하기

- 클로저 타입을 이미 알고 있다면, 파라미터 타입과 반환 타입을 생략할 수 있다.
- 클로저의 코드가 한 줄이면, 암시적으로 코드의 값만 반환한다. (return 생략해도 된다는 의미)

~~~swift
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
// [60, 57, 21, 36]
~~~

## 매우 짧은 클로저를 작성하는 유용한 방법

- 파라미터에 숫자로 접근할 수 있다.
- 함수의 마지막 인수로 전달된 클로저는 소괄호 뒤에 나타낼 수 있다.
- 클로저가 함수의 유일한 인수라면 소괄호를 생략할 수 있다.

> `func sorted(by areInIncreasingOrder: (Int, Int) throws -> Bool) rethrows -> [Int]`

~~~swift
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// [20, 19, 12, 7]
~~~
