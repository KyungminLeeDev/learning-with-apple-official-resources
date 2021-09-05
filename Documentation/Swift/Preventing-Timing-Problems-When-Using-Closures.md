# [공식문서로 iOS 배우기] Preventing Timing Problems When Using Closures

- [GitHub Repository](https://github.com/KyungminLeeDev/learning-with-apple-official-resources)
- 공식 자료를 학습하고 정리했으며 잘못된 정보가 있을 수 있습니다.
- 문서의 단순 번역은 `경어체`를, 직접 작성한 내용은 `평어체`를 사용합니다.
- 원문: Documentation > Swift > [Preventing Timing Problems When Using Closures](https://developer.apple.com/documentation/swift/preventing_timing_problems_when_using_closures)

## 💡 요약

- 클로저는 동기 또는 비동기적으로 호출될 수 있으므로 클로저의 결과를 사용할 때 주의해야 한다.
- 여러 번 호출되는 클로저에 한 번만 변경하는 코드 넣지 않기.
- 호출되지 않을 수 있는 클로저에 크리티컬한 코드 넣지 않기.

## 📌 메모

배운 내용이나 메모는 소제목에 압정(`📌`) 이모지를 표시하여 작성하고 이곳에 링크합니다.

- [📌 비동기 호출의 결과를 잘못 사용하는 예](#-비동기-호출의-결과를-잘못-사용하는-예)



<br/><br/><br/>



# Preventing Timing Problems When Using Closures

클로저에 대한 다양한 API 호출이 앱에 어떤 영향을 미칠 수 있는지 이해합니다.

## Overview

Swift에서 사용하는 많은 API는 클로저(또는 인스턴스로 전달된 함수)를 파라미터로 사용합니다. 클로저는 앱의 여러 부분과 소통 상호작용하는 코드를 넣을 수 있으므로, 당신이 전달하거나 API로 호출될 수 있는 다양한 클로저를 이해하는 것은 중요합니다. API로 전달한 클로저는 동기적으로(즉시) 또는 비동기적으로(얼마뒤에) 호출될 수 있습니다. 그것들은 한번, 여러번 호출되거나 호출되지 않습니다.

> **Important**  
> 클로저가 호출되는 시기에 대해 잘못 추정하면 데이터를 잘못 연결하고 앱이 크래시 될 수 있습니다.

## Understand the Results of Synchronous and Asynchronous Calls

> 동기적 및 비동기적 호출의 결과를 이해합니다.

클로저를 API에 전달할 때 클로저가 앱의 다른 코드와 상대적으로 언제 호출될지 고려하세요. 동기 API에서는 클로저 호출의 결과는 클로저를 전달한 후 즉시 사용가능합니다. 비동기 API에서는 얼마뒤 까지 결과를 사용할 수 없습니다(나중에 사용할 수 있다). 이 차이는 클로저와 클로저 이후에 코드를 작성하는 방법에 영향을 미칩니다.  
  
아래 예시는 `now(-)`와 `later(_:)` 두 함수를 정의합니다. 두 함수를 동일한 방법(전달인자 없는 trailing closure)으로 호출할 수 있습니다. 두 함수는 클로저를 받아 호출 하지만, `later(_:)` 는 클로저를 호출하기 전에 2초 기다립니다.

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

`now(_:)`와 `later(_:)` 함수는 앱 프레임워크의 클로저를 가진 메서드에서 만날 수 있는 API의 가장 흔한 두 유형인 `now(_:)` 같은 동기 API와 `later(_:)` 같은 비동기 API를 나타냅니다.  
  
클로저를 호출하는 것은 앱의 로컬과 글로벌 스테이트를 변경할 수 있기 때문에 클로저를 전달한 이후의 라인에 코드를 작성하는 것은 언제 클로저가 호출되는 시기에 대해 주의하여 작성되어야 합니다. 글자를 순차로 출력하는 간단한 작업도 클로저 호출의 타이밍에 영향을 받을 수 있습니다.

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

위 예시의 코드를 실행하면 보통은 B -> C -> D -> A 순서로 출력됩니다. A를 출력하는 라인이 맨 처음이지만 출력의 마지막 순서가 됩니다. 순서 차이는 `now(_:)`와 `later(_:)` 함수가 정의된 방법 때문에 발생합니다. 특정 실행 순서에 따라 코드를 작성한다면 각 함수가 클로저를 어떻게 호출하는데 알아야 합니다.

> **Note**  
> A가 다른 글자에 상대적으로 출력되는 순서는 보장되지 않습니다. 일반적인 시스템 상태에서는 대게 A가 마지막으로 출력되지만, 스레드 사이의 세심한 동기화 수행 없이 비동기적인 호출의 순서에 의존하는 코드를 작성하면 안 됩니다.

클로저를 가지는 API를 사용할 때는 이러한 시간에 기반한 실행 문제를 자주 고려해야 합니다. 많은 경우, 앱에 맞는 호출 순서는 한 가지이므로 앱의 상태가 어떻게 될지를 통해 생각하고 주어진 API를 사용하는 것이 중요합니다. API 이름과 파라미터 이름을 문서와 함께 사용하여 API가 동기식인지 비동기식인지 확인합니다. 
  
흔한 타이밍 실수는 동기적인 코드 호출 안에서 비동기적인 호출의 결과를 사용할 수 있다고 기대하는 것 입니다. 예를 들어, 위의 `later(_:)` 메서드는 URLSession 클래스의 dataTask(with:compltionHandler:) 메서드와 비슷하며 이것 또한 비동기식입니다. 
피해야 하는 타이밍 시나리오는 앱의 viewDidLoad() 메서드 안에서 dataTask(with:completionHandler) 메서드를 호출하고, completion handler로 전달한 클로저의 외부에서 결과를 사용하려 시도하는 것입니다.

### 📌 비동기 호출의 결과를 잘못 사용하는 예

> 피해야 하는 타이밍 시나리오는 앱의 viewDidLoad() 메서드 안에서 dataTask(with:completionHandler) 메서드를 호출하고, completion handler로 전달한 클로저의 외부에서 결과를 사용하려 시도하는 것입니다.

이 내용을 번역할 때 이해가 잘 안돼서 여러 번 다시 읽고 이해한 대로 번역했다. 여기서 말하는 시나리오는 아래 상황인 것 같다.  
  
dataTask 코드는 **Fetching Website Data into Memory** 문서의 예시를 가져왔다.

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

클로저의 result로 받아오는 데이터를 클로저의 외부에서 작성하면 않된다. `잘못된 위치`에 저 코드를 넣으면 클로저 외부에서는 data와 response를 모르므로 접근할 수도 없다.

## Don't Write Code That Makes a One-Time Change in a Closure That's Called Multiple Times

> 여러 번 호출되는 클로저에서 한 번만 변경하는 코드를 작성하지 마세요.

클로저를 여러번 호출하는 API에 클로저를 전달한다면, 외부의 상태를 한 번만 변경하기 위한 코드를 생략합니다.  
  
아래의 예시는 FileHandle 그리고 handle이 참조하는 파일에 쓸 데이터 라인 배열을 만듭니다.

~~~swift
import Foundation

let file = FileHandle(forWritingAtPath: "/dev/null")!
let lines = ["x,y", "1,1", "2,4", "3,9", "4,16"]
~~~

file의 각 라인을 작성하기 위해 클로저를 foeEach(_:) 메서드에 전달합니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
}
~~~

FileHandle 사용이 끝낫을 때, closeFile()로 종료합니다. closeFile()을 호출하는 적절한 위치는 클로저의 외부입니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
}

file.closeFile()
~~~

당신이 closeFile()의 요구 사항을 잘못 이해하면, 클로저 내부에 호출을 배치할 수도 있습니다. 그러면 앱이 크래시 됩니다.

~~~swift
lines.forEach { line in
    file.write("\(line)\n".data(using: .utf8)!)
    file.closeFile() // Error
}
~~~

## Don't Put Critical Code in a Closure That Might Not Be Called

> 호출되지 않을 수 있는 클로저에 크리티컬한 코드를 넣지 마세요.

API에 전달한 클로저가 호출되지 않을 가능성이 있다면 클로저에 앱을 지속하는 데 크리티컬한 코드를 넣지 마세요.  
  
아래 예시는 무작위로 당첨 번호를 정하며 당첨 번호를 맞춘 경우 completion handler를 호출하는 `Lottery` 열거형을 정의합니다.

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

호출된 completion handler에 의존하는 코드를 작성하는 것은 위험합니다. 무작위 번호가 당첨된다는 보장이 없으므로, 계산서 지불(복권에 당첨된 후로 예정된) 같은 중요한 액션은 일어나지 않을 수 있습니다.

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