# [공식문서로 Swift 배우기] A Swift Tour - 7. Error Handling

- 공식 자료를 학습하고 정리했으며, 잘못된 정보가 있을 수 있습니다.
- 원문: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

# Error Handling

## Error 프로토콜

- `Error`프로토콜을 채택한 모든 타입은 에러를 나타낼 수 있다.

~~~swift
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
~~~

## 함수의 에러 처리

- 에러를 던지려면 `throw`를 사용한다.
- 에러를 던질 수 있는 함수는 `throws`로 표시한다
- 함수에서 에러를 던지면, 함수는 즉시 반환되고 함수를 호출한 코드에서 에러를 처리한다.

~~~swift
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
~~~

## do-catch로 에러 처리하기

- 에러를 처리하는 방법 중 하나는 `do-catch`를 사용하는 것이다.
- `do`블럭 안에 에러가 발생할 수 있는 코드앞에 `try`로 표시한다.
- `catch`블럭 안에서 에러는 자동으로 `error`로 이름지어지고, 다른 이름을 사용할 수 있다.

~~~swift
do {
    let printerResponse = try send(job: 1040, toPrinter: "BiSheng")
    print(printerResponse)
} catch {
    print(error)
}
// Job sent

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}
// noToner
~~~

## 여러 개의 catch 사용하기

- 특정 에러를 처리하는 여러 개의 `catch`블럭을 제공할 수 있다.
- switch 문에서 case를 작성하는 것처럼 `catch` 뒤에 패턴을 작성한다.

~~~swift
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Job sent
~~~

## `try?`로 에러 처리하기

- 에러를 처리하는 또 다른 방법은 `try?`를 사용하여 결과를 옵셔널로 바꾸는 것이다.
- 함수가 에러를 던지면 구체적인 에러는 버려지고 결과는 `nil`이 된다.
- 에러를 던지지 않는다면, 결과는 함수가 반환한 옵셔널 값이 된다.

~~~swift
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
print(printerSuccess)
// Optional("Job sent")

let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerFailure)
// nil
~~~

## defer

- 함수가 반환되기 직전에 함수 안의 다른 코드가 모두 실행되고 나서 실행되는 코드의 블럭을 작성하려면 `defer`를 사용한다.
- defer의 코드는 함수에서 에러가 발생하더라도 실행된다.
- 다른 시간에 실행되어야 하는 설정 코드와 정리하는 코드를 defer를 사용하여 나란히 작성할 수 있다. (중요한 정리 작업을 잊지 않고 미리 작성할 수 있는 게 장점인 듯)

~~~swift
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
// false
~~~
