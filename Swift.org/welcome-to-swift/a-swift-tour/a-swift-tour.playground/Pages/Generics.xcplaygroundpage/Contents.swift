//: # Generics
//:

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



// Swift 표준 라이브러리의 옵셔널 타입을 구현해본 것
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

//: [Previous](@previous)
