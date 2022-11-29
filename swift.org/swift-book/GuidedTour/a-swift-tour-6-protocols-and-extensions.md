# [공식문서로 Swift 배우기] A Swift Tour - 6. Protocols and Extensions

- 공식 자료를 학습하고 정리했으며, 잘못된 정보가 있을 수 있습니다.
- 원문: [Swift.org - A Swift Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)
- 참고: [bbiguduk님의 한국어 번역본](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)
- [GitHub에서 보기](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)

# Protocols and Extensions

## 프로토콜 선언하기

- 프로토콜을 선언하려면 `protocol`을 사용한다.

~~~swift
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
~~~

## 프로토콜 채택하기

- 클래스, 열거형, 구조체는 프로토콜을 채택할 수 있다.
- 구조체를 수정하는 메서드에는 `mutating`키워드를 표시한다.
- 클래스의 메서드는 항상 클래스를 수정하므로 `mutating`표시가 필요 없다.

~~~swift
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)
// A very simple class.  Now 100% adjusted.

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)
// A simple structure (adjusted)
~~~

## exntension으로 타입에 프로퍼티 채택하기

- 기존의 타입에 새로운 메서드나 계산 프로퍼티 같은 기능을 추가하려면 `extension`을 사용한다.
- 다른 곳에서 선언된 되거나, 라이브러리 또는 프레임워크의 타입에 extension을 사용해서 프로토콜 준수를 추가할 수 있다.

~~~swift
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// The number 7
~~~

## 프로토콜을 타입처럼 사용하기

- 다른 타입들처럼 프로토콜 이름을 사용할 수 있다.
- 타입이 다르지만 모두 하나의 프로토콜을 준수하는 객체의 콜렉션을 만들 수 있다.
- 프로토콜 타입인 값을 사용하는 경우, 프로토콜 정의 외부의 메서드는 사용할 수 없다.
- 컴파일러는 주어진 프로토콜의 타입으로 처리하므로 실수로 프로토콜 외에 클래스의 메서드나 프로퍼티에 접근할 수 없다.

~~~swift
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// A very simple class.  Now 100% adjusted.
// print(protocolValue.anotherProperty) // 에러를 확인하려면 주석을 지우기
print(a.anotherProperty)
// 69105
~~~
