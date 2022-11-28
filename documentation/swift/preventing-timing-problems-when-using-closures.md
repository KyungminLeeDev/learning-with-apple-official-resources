# [Preventing Timing Problems When Using Closures](https://developer.apple.com/documentation/swift/preventing_timing_problems_when_using_closures)

`Article`

Understand how different API calls to your closures can affect your app.

> 클로저의 다양한 API 호출이 앱에 어떤 영향을 미칠 수 있는지 이해해 봅니다.

## Overview

Many of the APIs you use in Swift take a closure—or a function passed as an instance—as a parameter. Because closures can contain code that interacts with multiple parts of an app, it’s important to understand the different ways closures can be called by the APIs you pass them to. Closures you pass to APIs can be called synchronously (immediately) or asynchronously (sometime later). They may be called once, many times, or never.

> 스위프트에서 사용하는 많은 API는 클로저(또는 인스턴스로 전달된 함수)를 파라미터로 사용합니다. 클로저는 앱의 여러 부분과 소통 상호작용하는 코드를 넣을 수 있으므로, 당신이 전달하거나 API로 호출될 수 있는 다양한 클로저를 이해하는 것은 중요합니다. API로 전달한 클로저는 동기적으로(즉시) 또는 비동기적으로(얼마 뒤에) 호출될 수 있습니다. 그것들은 한번, 여러 번 호출되거나 호출되지 않습니다.

> **Important**  
>
> Making false assumptions about when a closure is called can lead to data inconsistency and app crashes.
>
>> 클로저가 호출되는 시기에 대해 잘못 추정하면 데이터가 불완전하고 앱이 크래시 될 수 있습니다.

## Understand the Results of Synchronous and Asynchronous Calls

When you pass a closure to an API, consider when that closure will be called relative to the other code in your app. In synchronous APIs, the result of calling the closure will be available immediately after you pass the closure. In asynchronous APIs, the result won’t be available until sometime later; this difference affects how you write code both in your closure as well as the code following your closure.

> 클로저를 API에 전달할 때 클로저가 앱의 다른 코드와 상대적으로 언제 호출될지 고려하세요. 동기 API에서는 클로저 호출의 결과는 클로저를 전달한 후 즉시 사용 가능합니다. 비동기 API에서는 어느 정도 이후까지는 결과를 사용할 수 없습니다(나중에 사용할 수 있다는 의미). 이 차이는 클로저와 클로저 이후에 코드를 작성하는 방법에 영향을 미칩니다.

The example below defines two functions, now(_:) and later(_:). You can call both functions the same way: with a trailing closure and no other arguments. Both now(_:) and later(_:) accept a closure and call it, but later(_:) waits a couple seconds before calling its closure.
  
> 아래 예시는 now(_:)와 later(_:)는 두 함수를 정의합니다. 두 함수를 동일한 방법(전달인자 없는 후행 클로저)으로 호출할 수 있습니다. 두 함수는 클로저를 받아 호출하지만, later(_:)는 클로저를 호출하기 전에 2초 기다립니다.

~~~swift
import Dispatch
let queue = DispatchQueue(label: "com.example.queue")

func now(_ clousre: () -> Void) {
    closure()
}

func later(_ closure: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + 2) {
        closure()
    }
}
~~~

The now(_:) and later(_:) functions represent the two most common categories of APIs you’ll encounter in methods from app frameworks that take closures: synchronous APIs like now(_:), and asynchronous APIs like later(_:).

> now(_:)와 later(_:) 함수는 앱 프레임워크의 클로저를 가진 메서드에서 만날 수 있는 API의 가장 흔한 두 유형인 now(_:) 같은 동기 API와 later(_:) 같은 비동기 API를 나타냅니다.

Because calling a closure can change the local and global state of your app, the code you write on the lines after passing a closure needs to be written with a careful consideration of when that closure is called. Even something as simple as printing a sequence of letters can be affected by the timing of a closure call:
  
> 클로저를 호출하는 것은 앱의 로컬과 글로벌 스테이트를 변경할 수 있기 때문에 클로저를 전달한 이후의 라인에 코드를 작성하는 것은 언제 클로저가 호출되는 시기에 대해 주의하여 작성되어야 합니다. 글자를 순차로 출력하는 간단한 작업도 클로저 호출의 타이밍에 영향을 받을 수 있습니다.

~~~swift
later {
    print("A") // Eventually prints "A"
}
print("B") // Immediately prints "B"

now {
    print("C") // Immediately prints "C"
}
print("D") // Immedately prints "D"

// Prevent the program from exiting immediately if you're running this code in Terminal.
let semaphore = DispatchSemaphore(value: 0).wait(timeout: .now() + 10)
~~~

Running the code in the example above usually prints the letters in the order B → C → D → A. Even though the line that prints A is first in the code, it’s ordered later in the output. The ordering difference happens due to the way the *now(_:)* and *later(_:)* functions are defined. You need to know how each function calls its closure if you write code that relies on a specific execution order.

> 위 예시의 코드를 실행하면 보통은 B → C → D → A 순서로 출력됩니다. A를 출력하는 라인이 맨 처음이지만 출력의 마지막 순서가 됩니다. 순서 차이는 now(_:)와 later(_:) 함수가 정의된 방법 때문에 발생합니다. 특정 실행 순서에 따라 코드를 작성한다면 각 함수가 클로저를 어떻게 호출하는데 알아야 합니다.

> **Note**  
>
> The oder in which A is printed relative to the other letters isn’t guaranteed. Under typical system conditions, it’s usually printed last, but you shouldn’t write code that relies on the order of an asychronous call relative to synchronous code without performing more careful synchronization between threads.
>
>> A가 다른 글자에 상대적으로 출력되는 순서는 보장되지 않습니다. 일반적인 시스템 상태에서는 대게 A가 마지막으로 출력되지만, 스레드 사이의 세심한 동기화 수행 없이 비동기적인 호출의 순서에 의존하는 코드를 작성하면 안 됩니다.

You’ll need to consider this kind of time-based execution problem frequently when using APIs that take closures. In many cases, only one sequence of calls is correct for your app, so it’s important to think through what the state of your app will be, given the APIs you’re using. Use API names and parameter names along with documentation to determine whether an API is synchronous or asynchronous.

> 클로저를 가지는 API를 사용할 때는 이러한 시간에 기반한 실행 문제를 자주 고려해야 합니다. 많은 경우, 앱에 맞는 호출 순서는 한 가지이므로 앱의 상태가 어떻게 될지를 통해 생각하고 주어진 API를 사용하는 것이 중요합니다. API 이름과 파라미터 이름을 문서와 함께 사용하여 API가 동기식인지 비동기식인지 확인합니다.

A common timing mistake is expecting the results of an asynchronous call to be available within the calling synchronous code. For example, the later(_:) method above is comparable to the [`URLSession`](https://developer.apple.com/documentation/foundation/urlsession) class’s [`dataTask(with:completionHandler:)`](https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask) method, which is also asynchronous. A timing scenario you should avoid is calling the [`dataTask(with:completionHandler:)`](https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask) method within your app’s [`viewDidLoad()`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload) method and attempting to use the results outside of the closure you pass as the completion handler.
  
> 흔한 타이밍 실수는 동기적인 코드 호출 안에서 비동기적인 호출의 결과를 사용할 수 있다고 기대하는 것입니다. 예를 들어, 위의 later(_:) 메서드는 `URLSession` 클래스의 `dataTask(with:compltionHandler:)` 메서드와 비슷하며 이것 또한 비동기식입니다. 
피해야 하는 타이밍 시나리오는 앱의 `viewDidLoad()` 메서드 안에서 `dataTask(with:completionHandler)` 메서드를 호출하고, 컴플리션 핸들러로 전달한 클로저의 외부에서 결과를 사용하려 시도하는 것입니다.

### 📌 비동기 호출의 결과를 잘못 사용하는 예시

> 피해야 하는 타이밍 시나리오는 앱의 viewDidLoad() 메서드 안에서 dataTask(with:completionHandler) 메서드를 호출하고, 컴플리션 핸들러로 전달한 클로저의 외부에서 결과를 사용하려 시도하는 것입니다.

위 내용이 잘 이해되지 않아서 여러 번 다시 읽고 이해한 대로 번역했다. 여기서 말하는 것은 아래 상황으로 생각된다.  
  
아래 코드는 `Fetching Website Data into Memory` 문서의 예시를 가져왔다.

~~~swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let url = URL(string: "https://www.example.com/")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            self.handleClientError(error)
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
            self.handleServerError(response)
            return
        }

        // 옳은 위치
        if let mimeType = httpResponse.mimeType, mimeType == "text/html",
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                self.webView.loadHTMLString(string, baseURL: url)
            }
        }
    }
    task.resume()

    // 잘못된 위치
    if let mimeType = httpResponse.mimeType, mimeType == "text/html",
        let data = data,
        let string = String(data: data, encoding: .utf8) {
        self.webView.loadHTMLString(string, baseURL: url)
    }
}
~~~

dataTask(with:)의 클로저는 결과로 받아오는 데이터를 클로저의 외부에서 작성하면 안 된다. `잘못된 위치`에 저 코드를 넣으면 클로저 외부에서는 data와 response를 모르므로 접근할 수도 없기 때문이다.

## Don't Write Code That Makes a One-Time Change in a Closure That's Called Multiple Times

If you’re going to pass a closure to an API that might call it multiple times, omit code that’s intended to make a one-time change to external state.

> 클로저를 여러 번 호출하는 API에 클로저를 전달한다면, 외부의 상태를 한 번만 변경하기 위한 코드를 생략합니다. 

The example below creates a [`FileHandle`](https://developer.apple.com/documentation/foundation/filehandle) and an array of data lines to write to the file that the handle refers to:
  
> 아래의 예시는 `FileHandle` 그리고 handle이 참조하는 파일에 쓸 데이터 라인 배열을 만듭니다.

~~~swift
import Foundation

let file = FileHandle(forWritingAtPath: "/dev/null")!
let lines = ["x,y", "1,1", "2,4", "3,9", "4,16"]
~~~

To write each line to the file, pass a closure to the [`forEach(_:)`](https://developer.apple.com/documentation/swift/array/foreach(_:)) method:

> file의 각 라인을 작성하기 위해 클로저를 `forEach(_:)` 메서드에 전달합니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
}
~~~

When you’re finished using a [`FileHandle`](https://developer.apple.com/documentation/foundation/filehandle), close it using [`closeFile()`](https://developer.apple.com/documentation/foundation/filehandle/1413393-closefile). The correct placement of the call to [`closeFile()`](https://developer.apple.com/documentation/foundation/filehandle/1413393-closefile) is outside of the closure:

> `FileHandle` 사용이 끝낫을 때, `closeFile()`로 종료합니다. `closeFile()`을 호출하는 적절한 위치는 클로저의 외부입니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
}

file.closeFile()
~~~

If you misunderstand the requirements of [`closeFile()`](https://developer.apple.com/documentation/foundation/filehandle/1413393-closefile), you might place the call inside the closure. Doing so crashes your app:

> 당신이 `closeFile()`의 요구 사항을 잘못 이해하면, 클로저 내부에서 호출할 수도 있습니다. 그러면 앱이 크래시 됩니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
    file.closeFile() // Error
}
~~~

## Don't Put Critical Code in a Closure That Might Not Be Called

If there’s a chance that a closure you pass to an API won’t be called, don’t put code that’s critical to continuing your app in the closure.

> API에 전달한 클로저가 호출되지 않을 가능성이 있다면 클로저에 앱을 지속하는 데 크리티컬한 코드를 넣지 마세요. 

The example below defines a *Lottery* enumeration that randomly picks a winning number and calls a completion handler if the right number is guessed:
  
> 아래 예시는 무작위로 당첨 번호를 정하며 당첨 번호를 맞춘 경우 컴플리션 핸들러를 호출하는 Lottery 열거형을 정의합니다.

~~~swift
enum Lottery {
    static var lotteryWinHandler: (() -> Void)?
    
    @discardableResult static func pickWinner(guess: Int) {
        print("Running the lottery.")
        if guess == Int.random(in: 0 ..< 100_000_000), let winHandler = lotteryWinHandler {
            winHandler()
            return true
        }
        
        return false
    }
}
~~~

Writing code that depends on the completion handler being called is dangerous. There’s no guarantee that the random guess will be correct, so important actions like paying bills—scheduled for after you win the lottery—might never happen.

> 호출된 컴플리션 핸들러에 의존하는 코드를 작성하는 것은 위험합니다. 무작위 번호가 당첨된다는 보장이 없으므로, 계산서 지불(복권에 당첨된 후로 예정된) 같은 중요한 액션은 일어나지 않을 수 있습니다.

~~~swift
func payBills() {
    amountOwed = 0
}

var amountOwed = 25
let myLuckyNumber = 42

Lottery.lotteryWinHandler = {
    print("Congratulations!")
    payBills()
}

// You get 10 chances at winning.
for _ in 1..10 {
    Lottery.pickWinner(guess: myLuckyNumber)
}

if amountOwed > 0 {
    fatalError("You need to pay your bills before proceeding.")
}

// 이 라인 밑에 위치한 코드는 복권에 당첨된 경우에만 실행됩니다.
~~~

## 📌 요약

- 클로저는 동기 또는 비동기적으로 호출될 수 있으므로 클로저의 결과를 사용할 때 주의해야 한다
- 여러 번 호출되는 클로저에 한 번만 변경하는 코드 넣지 않기
- 호출되지 않을 수 있는 클로저에 크리티컬한 코드 넣지 않기