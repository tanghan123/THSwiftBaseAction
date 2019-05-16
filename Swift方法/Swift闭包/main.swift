////
////  main.swift
////  Swift闭包
////
////  Created by chaomeng on 2019/4/1.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation
//
//MARK: 一、闭包的基本形式
//这是一个最基本的闭包的形式：
//{ (parameters) -> return type in
//    statements
//}

//闭包中，包含三要素： 参数，返回类型，闭包体。  其中参数和返回类型可以忽略， 但是一个闭包体必需存在，实际上就算在闭包体里面，什么都不写，闭包体本身还是以不执行任何代码的形式存在。
//
let names = ["1" ,"2" ,"4" ,"3"]
let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//这是一个高阶函数，同时，也是一个闭包的基本使用。包含了 参数及类型，返回值类型，闭包体。

//我们可以简写闭包的形式，采用内联的方式书写：

let reversedNames2 = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//在闭包中，因为包含了上下文的变量和常量的引用，并做了类型推断，所以，实际上，对于闭包的参数来说，类型是固定的,当然返回的类型也是固定的，swift允许开发者书写时省略。就像下面这样:

let reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2 } )
//如果闭包是的闭包体是单个表达式（只有一条执行语句）的时候，甚至可以将return都省略

let reversedNames4 = names.sorted(by: { s1, s2 in s1 > s2 } )
//另外swift的闭包又一个特性：Swift自动为内联闭包提供简写参数名称，可用于通过名称$ 0，$ 1，$ 2等引用闭包参数的值。

//如果在闭包表达式中使用这些简写参数名称，则可以从其定义中省略闭包的参数列表，并根据预期的函数类型推断速记参数名称的数量和类型。 in关键字也可以省略，因为闭包表达式完全由其主体组成：
//
let reversedNames5 = names.sorted(by: { $0 > $1 } )
//这样还不够完美，如果将” > “符号重载，使  $0 > $1 直接用 > 代替是不是更加简洁呢？ 当然可以，事实上，swift中的 > 已经被定义了 > 指代两个Swift string之间的比较，并返回一个 Bool值。那么我们的最终版本应该是这样的：

let reversedNames6 = names.sorted(by: >)
//MARK: 二、尾随闭包
//如果你定义了一个闭包，将之作为一个函数的最后的一个参数，并且，由于之前还包含了其他的参数，导致这个函数变得很长，你可以使用一种简短的方式书写闭包。像下面这样的函数：

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
//如果我们调用的使用，应该是这样的：

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
//像这样的情况，我们考虑它构成了尾随闭包，对于尾随闭包，有另一中更加简便的方式书写：

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
//注意，这时候，闭包的标签   closure  应该被省略。
//这样的情况，我们可以写出闭包的最终版本的特别版本：

let reversedNames7 = names.sorted(by: >)
//尾随闭包使用在一个长度很长的闭包下，效果更好。你可以使用这个技巧写出很简短优雅的代码。

//MARK: 三、闭包捕获值
//之前其实已经介绍了，闭包的本质类似于一个嵌套函数，它具有和嵌套函数一样能力：获取局部的变量和常量，在一个闭包中：它可以获取到外部函数所有参数，和外部函数内定义的任何的常量和变量。
//
//这里有个嵌套的函数，他和闭包的作用一样：
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
//incrementer 可以获取到amount和runingTotal的值来使用。

//调用：

let incrementByTen = makeIncrementer(forIncrement: 10)    //绑定引用， 保证用完不会消失。
print(incrementByTen())
// returns a value of 10
print(incrementByTen())
// returns a value of 20
print(incrementByTen())
// returns a value of 30

//incrementer 这个嵌套的函数一值在改变runningTotal的值，同时接收不断变化的amount。
//
//如果换一个函数变量引用，那么值则会被刷新：
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
// returns a value of 7
//闭包的引用具有关联性。和一般的变量一样：

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
// returns a value of 50

//MARK: 四、逃逸闭包
//在网络请求的过程中，大部分时候都是异步操作的，一般的闭包，虽然已经定义了闭包的闭包体（闭包实现），但是在请求回调的时候，闭包可能不会被调用。原因是可能被释放， 或者可能被修改。
//
//如果需要保证做到异步的调用，那么需要在闭包的参数前加 @escaping标记。
//
//添加@escaping标记的闭包，意味着，如果需要访问自身的自身的变量的时候，必须在闭包内包含自身的引用（或者自身的属性、变量等）。
//
//下面是两种是否带标签的闭包的对比：

//var completionHandlers: [() -> Void] = []
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//两者调用：

//class SomeClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure { self.x = 100 }
//        someFunctionWithNonescapingClosure { x = 200 }
//    }
//}
//默认的闭包都是 非逃逸闭包。

//MARK: 五、Autoclosures 自动闭包
//自动闭包的意思是当闭包做为函数的参数的时候，对于闭包的内容执行的时机取决于谁。  普通的闭包，将会在读取闭包的时候执行，而自动闭包，在读取的时候，将闭包做为其参数类型处理，只有等到执行闭包的时候才会处理闭包内的内容。
//

var  customersInLine = ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
 //Prints "Now serving Ewa!"


//在执行之前，customerProvider被当作一个 () -> String 处理，而不会涉及到闭包体内部的处理。 如果不使用@autoclosure，那么函数处理闭包体内的内容。
//
//日常的开发可以使用：
//public func Dlog( item:@autoclosure ()->Any){
//    #if DEBUG
//    print(item())
//    #else
//
//    #endif
//}

//默认的自动闭包是 非逃逸闭包，如果想变成逃逸闭包，可以如下：
//
//func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
//    customerProviders.append(customerProvider)
//}

//6、Swift中闭包的循环引用
//循环引用可以简单的理解为A引用了B,而B又引用A双方都同时保持对方的一个引用，在释放的时候A和B都会的等待对方先释放，这样两个都不会释放，造成内存的泄露，并且如果过于频繁或者两者的处理量比较大时会发生崩溃。如何判断类的循环引用，需要重新类的析构函数如下：
//deinit {
//    print("销毁了"+NSStringFromClass(self.classForCoder));
//}
//
//以下为几种常见的对循环引用的解决方案。
//方案一：
//仿照OC 解决处理循环引用用weak进行修饰，将上面的中的闭包的实现修改，建议在开发总使用该解决方案
//方案二：
//处理循环引用[weak self]来完成
//方案三：
//处理循环引用[unowned self]
//三种方案的具体代码如下：
//创建一个闭包类型
typealias ClosureClick = ()->Void;
class TestView: Any {
    //为自定义的VIew 创建一个闭包的类型的属性
    var myClosure:ClosureClick?
    //给类添加一个属性
    var classNum:Int?
    //这里就不用提前调用闭包了
    var testClosure:((Int)->Void)?
    func btnClick() -> Void {
        //在这里调用闭包
        if (myClosure != nil) {
            myClosure!()
        }
    }
    func testC(myNum:Int) -> Void {
        //产生循环引用的
        testClosure = {(myNum)->Void in
            self.classNum = myNum;
        }
        //方案1
        weak var weakSelf = self
        testClosure = {(myNum)->Void in
            weakSelf?.classNum = myNum;
        }
        //方案2
        //[weak self] 表示 self为可选型 可以为nil 所以在使用的时候必须解包
        testClosure = {[weak self](myNum)->Void in
            self?.classNum = myNum;
        }
        //方案3
        //[unowned self]由于在使用前要保证一定有这个对象 所以不必解包
        testClosure = {[unowned self](myNum)->Void in
            self.classNum = myNum;
        }

    }
    deinit {
        print("销毁了");
    }
    
}
