//: # Objects and Classes
//:

//: ## 클래스 생성하기
//:
//: - 클래스의 이름 앞에 `class`를 사용하여 클래스를 만든다.
//: - 클래스의 프로퍼티를 선언하는 방법은 클래스의 컨텍스트 안에 작성해야 한다는 것 외에는 상수나 변수를 선언하는 방법과 같다.
//: - 클래스의 메서드와 함수의 선언도 동일하다.
//:
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}



//: ## 클래스의 인스턴스 생성하고 프로퍼티와 메서드 접근하기
//:
//: - 클래스 이름 뒤에 소괄호를 붙여 클래스의 인스턴스를 생성한다.
//: - 인스턴스의 프로퍼티와 메서드에 접근하려면 점(`.`) 구문을 사용한다
//:
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)
// A shape with 7 sides.



//: ## 클래스의 initializer
//:
//: - `Shape` 클래스는 `initializer`가 누락됐다.
//: - `initializer`는 인스턴스가 생성될 때 클래스를 설정한다.
//: - `init`을 사용해서 `initializer`를 만든다.
//: - `initializer`에서 `self`를 사용해서 `name`인수와 `name`프로퍼티를 구분한다.
//: - 모든 프로퍼티는 값이 할당되어야 한다.
//: - `numberOfSides`는 선언 시에 값을 할당한다.
//: - `name`은 `initializer`에서 값을 할당한다.
//: - 객체가 할당 해제되기 전에 무언가 정리해야 한다면 `deinitializer`를 사용한다.
//: - `deinitializer`은 `deinit`을 사용해서 만든다.
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//: ## 클래스 상속
//:
//: - 하위 클래스는 이름 뒤에 콜론과 상위 클래스 이름을 적는 것으로 상위 클래스를 포함한다.
//: - 필요에 따라 상위 클래스를 포함하거나 생략할 수 있다.
//: - 상위 클래스의 구현을 재정의 하는 하위 클래스의 메서드는 `override`로 표시된다.
//: - 실수로 `override` 적지 않더라도 컴파일러가 에러로 감지한다.
//: - `override` 메서드가 실제로 상위 클래스의 메서드가 아닌 것도 컴파일러가 감지한다.
//:
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
// 27.040000000000003
print(test.simpleDescription())
// A square with sides of length 5.2.



//: ## 프로퍼티 `getter`, `setter`
//:
//: - 프로퍼티는 `getter`와 `setter`를 가질 수 있다.
//: - `setter`에서 새로운 값은 암시적으로 `newValue`로 이름 지어진다.
//:     - `set` 뒤에 소괄호 안에 명시적으로 새로운 값의 이름을 제공할 수 있다.
//: - `EquilateralTriangle` 클래스의 `initialize`는 세 개의 스 텝이 있다.
//:     1. 하위 클래스에 선언된 프로퍼티의 값을 설정한다.
//:     2. 상위 클래스의 `initialize`를 호출한다.
//:     3. 상위 클래스에 정의된 프로퍼티의 값을 변경한다. 메서드, getter, setter를 사용하는 추가 작업도 이 시점에 할 수 있다.
//:
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// 9.3
triangle.perimeter = 9.9
print(triangle.sideLength)
// 3.3000000000000003



//: ## willSet, didSet
//:
//: - 프로퍼티를 계산할 필요는 없지만 새로운 값을 설정하기 전과 후에 실행되는 코드를 제공하려면 `willSet`, `didSet`을 사용한다.
//: - `willSet`, `didSet`으로 제공한 코드는 `initializer`외부에서 값이 바뀔 때 마다 실행된다. (`initializer`에서는 willSet, didSet 실행되지 않는다는 말)
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// 10.0
print(triangleAndSquare.triangle.sideLength)
// 10.0
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// 50.0



//: ## 옵셔널 값 처리
//:
//: - 옵셔널 값을 처리할 때 메서드, 프로퍼티, 서브스크립트전에 `?`를 적을 수 있다.
//: - `?`전의 값이 `nil`이면 `?`이후의 모든 것은 무시되며 전체 표현의 값은 `nil`이다.
//: - `?`전의 값이 `nil`이 아니면, 옵셔널 값은 언랩핑되며 `?`이후의 모든 것은 언랩핑된 값으로 동작한다.
//: - 위 두 가지 경우 모든 표현식은 옵셔널 값이다.
//:
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



//: [Previous](@previous) | [Next](@next)
