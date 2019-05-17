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
//闭包的表达式语法
//{ (parameters/接收的参数) -> (return type/闭包返回值类型) in
//    statements/保存在闭包中需要执行的代码
//}
//闭包根据你的需求是有类型的，闭包的类型 一般形式如下:
//(parameters/接收的参数) -> (return type/闭包返回值类型)

// 简单实例
let sum = {(a: Int, b: Int) -> Int in
    return a + b
}
let s = sum(10, 15)
print(s)

// 从上下文中推导参数和返回值类型
let sum1 = { (a, b) -> Int in
    return a + b
}
print(sum1(25, 25))
//归纳：闭包类型是由参数类型和返回值类型决定的，和函数是一样的。闭包的类型是(parameters) -> returnType

// MARK: 二. 起别名
//利用typealias为闭包类型定义别名
//typealias是Swift中用来为已经存在的类型重新定义名字的关键字（类似于OC语法中的 typedef），重新命名的新名字用来替代之前的类型，并且能够使代码变得更加清晰简单容易理解。typealias 的用法很简单，直接用 = 赋值就可以了：

//这是一个高阶函数，同时，也是一个闭包的基本使用。包含了 参数及类型，返回值类型，闭包体。
//typealias <type name> = <type expression>
typealias myCloust = (_ str:String) -> Void

typealias Add1 = (Int, Int) -> (Int)

// MARK: 闭包的创建，赋值，调用
//闭包表达式语法能够使用常量形式参数、变量形式参数和输入输出形式参数，但不能提供默认值。可变形式参数也能使用，但需要在形式参数列表的最后面使用。元组也可被用来作为形式参数和返回类型。在闭包的中会用到一个关键字in，in 可以看做是一个分割符，他把该闭包的类型和闭包的函数体分开，in前面是该闭包的类型，in后面是具体闭包调用时保存的需要执行的代码。表示该闭包的形式参数类型和返回类型定义已经完成，并且闭包的函数体即将开始执行。这里总结了一下可能用到的几种形式实现闭包的创建、赋值、调用的过程。

//** 方式一：利用typealias最完整的创建**
//为(_ num1: Int, _ num2: Int) -> (Int) 类型的闭包定义别名：Add
typealias Add = (_ num1: Int, _ num2: Int) -> (Int)
//创建一个 Add 类型的闭包常量：addCloser1
let addCloser1: Add
//为已经创建好的常量 addCloser1 赋值
addCloser1 = {
    (_ num1: Int, _ num2: Int) -> (Int) in
    return num1 + num2
}
//调用闭包并接受返回值
let result = addCloser1(20, 10)

//形式二：闭包类型申明和变量的创建合并在一起
//创建一个 (_ num1: Int, _ num2: Int) -> (Int) 类型的闭包常量：addCloser1
let addCloser2: (_ num1: Int, _ num2: Int) -> (Int)
//为已经创建好的常量 addCloser1 赋值
addCloser2 = {
    (_ num1: Int, _ num2: Int) -> (Int) in
    return num1 + num2
}
//调用闭包并接受返回值
let resul2 = addCloser2(20, 10)

//形式三：省略闭包接收的形参、省略闭包体中返回值
//创建一个 (Int, Int) -> (Int) 类型的闭包常量：addCloser1
let addCloser3: (Int, Int) -> (Int)
//为已经创建好的常量 addCloser1 赋值
addCloser3 = {
    (num1, num2) in
    return num1 + num2
}
//调用闭包并接受返回值
let result3 = addCloser3(20, 10)

//形式四：在形式三的基础上进一步精简
//创建一个 (Int, Int) -> (Int) 类型的闭包常量：addCloser1 并赋值
let addCloser4: (Int, Int) -> (Int) = {
    (num1, num2) in
    return num1 + num2
}
//调用闭包并接受返回值
let result4 = addCloser4(20, 10)

//形式六：简写的实际参数名
//创建一个 () -> (String) 类型的闭包常量：addCloser1 并赋值
let addCloser5: () -> (String) = {
    return "这个闭包没有参数，但是有返回值"
}
//调用闭包并接受返回值
let result5 = addCloser5()

//得益于Swift的类型推断机制，我们在使用闭包的时候可以省略很多东西，而且Swift自动对行内闭包提供简写实际参数名，你也可以通过 $0, $1, $2 这样的语法来引用闭包的实际参数值。如果你在闭包表达式中使用这些简写实际参数名，那么你可以在闭包的实际参数列表中忽略对其的定义，并且简写实际参数名的数字和类型将会从期望的函数类型中推断出来。in关键字也能被省略，$0 和 $1 分别是闭包的第一个和第二个 String类型的 实际参数（引自文档翻译）。

// MARK: 三. 闭包的可选类型
//注意点：我们在为SecondViewController定义变量闭包属性的时候需要将类型申明为可选类型，闭包可选类型应该是((String) -> ())?而不是(String) -> ()?的，后者指的是闭包的返回值是可选类型。
//class SecondViewController: UIViewController {
//    //输入文本框
//    var textField: UITextField!
//    //为创建一个(String) -> () 的可选类型的闭包变量作为控制器的属性
//    var closer: ((String) -> ())?
//    //返回按钮的点击事件
//    func backButtonDidClick(_ sender: AnyObject) {
//        //首先判断closer闭包是否已经被赋值，如果已经有值，直接调用该闭包，并将输入的文字传进去。
//        if closer != nil {
//            closer!(textField.text!)
//        }
//        //navigationController?.popViewController(animated: true)
//    }
//}

//MARK: 四. 闭包简写
let num = [1, 2, 3, 4, 5, 6, 7]
let sortNum = num.sorted(by: {
    (a: Int, b: Int) -> Bool in
    return a > b
})
print("第一次排序: \(sortNum)")

// swift类型推导，根据后面的括号传参能自动判断参数的类型
let sortNum1 = sortNum.sorted(by: {
    (a, b) in
    return a < b
})
print("第二次排序: \(sortNum1)")

// 单表达式的闭包隐式返回，可以省略return关键字
let sortNum2 = sortNum1.sorted(by: {
    (a, b) in
    a > b
})
print("第三次次排序: \(sortNum2)")

// 速记参数名，和隐式返回。Swift提供速记参数名关联闭包参数（需要省略参数列表，并根据预期的函数类型推断速记参数名的数量和类型），从$0开始
let sortNum3 = sortNum2.sorted(by: {
    $0 < $1
})
print("第四次次排序: \(sortNum3)")

// sorted方法还可以使用函数进行排序
func sortNumArr(a: Int, b: Int) -> Bool
{
    return a > b
}
let sortNum4 = sortNum3.sorted(by: sortNumArr)
print("第五次次排序: \(sortNum4)")

// 五. 尾随闭包
let sortNum10 = num.sorted() {
    (a: Int, b: Int) -> Bool in
    return a > b
}

print("第一次排序: \(sortNum)")
//若将闭包作为函数参数最后一个参数，可以省略参数标签，将闭包表达式写在函数调用括号后面
func sum(by: (Int, Int) -> Int) -> Int {
    return by(10 ,20)
}
let num2 = sum() {
    (a, b) in
    return a + b
}
print("和为 \(num)")


func sum1(a: Int, b: Int, by: (Int, Int) -> Int) -> Int{
    return by(a, b)
}

let num1 = sum1(a: 10, b: 30) {
    (a, b) in
    return a + b
}
print("和为 \(num1)")

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


//尾随闭包使用在一个长度很长的闭包下，效果更好。你可以使用这个技巧写出很简短优雅的代码。

//MARK: 六、闭包捕获值
//闭包的本质类似于一个嵌套函数，它具有和嵌套函数一样能力：获取局部的变量和常量，在一个闭包中：它可以获取到外部函数所有参数，和外部函数内定义的任何的常量和变量。
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
let incrementByTen = makeIncrementer(forIncrement: 10)   //绑定引用， 保证用完不会消失。
print(incrementByTen())
// returns a value of 10
print(incrementByTen())
// returns a value of 20
print(incrementByTen())
// returns a value of 30

//incrementer 这个嵌套的函数一值在改变runningTotal的值，同时接收不断变化的amount。
//如果换一个函数变量引用，那么值则会被刷新：
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
//闭包的引用具有关联性。和一般的变量一样：
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
// returns a value of 50

//闭包可以在其定义的上下文中捕获常量和变量。及时定义这些常量和变量的原始范围不再存在了，闭包也可以引用并修改这些常量和变量的值。

//嵌套函数捕获值
func sjzFunc(a:Int) -> (() -> Int)? {
    var sjz = 0
    func addSjz() -> Int {
        sjz += a
        return sjz
    }
    let num =  addSjz()
    print("sjz的值为：\(sjz), a的值为：\(a) num\(num)")
    return addSjz
}
let sjzF = sjzFunc(a: 100)!
print("值为：\(sjzF())")
print("值为：\(sjzF())")
print("值为：\(sjzF())")
print("值为：\(sjzF())")

//闭包捕获值：
func sjzFun1(a: Int) -> () -> Int {
    var sjz = 0
    
    // 闭包
    let addSjz: () -> Int = {
        sjz += a
        return sjz
    }
   let num =  addSjz()
    print("sjz的值为：\(sjz), a的值为：\(a) num\(num)")
    
    return addSjz
}

let sjzF1 = sjzFun1(a: 100)
print("值为：\(sjzF1())")
print("值为：\(sjzF1())")
print("值为：\(sjzF1())")
print("值为：\(sjzF1())")
//可以看出，当调用addSjz的时候，sjz的值也改变了addSjz捕获对变量sjz和参数a的引用，通过引用捕获确保sjzFunc结束时，sjz和a不会消失。并且确保了下次调用sjzF时，sjz可用。当它们不再需要时，Swift处理变量的所有内存管理。
//函数和闭包是引用类型。也就是说，当给变量和常量赋值闭包或函数时，变量和常量被赋值为闭包或函数的引用。


//MARK: 七、逃逸闭包
//默认的闭包都是 非逃逸闭包。
//在网络请求的过程中，大部分时候都是异步操作的，一般的闭包，虽然已经定义了闭包的闭包体（闭包实现），但是在请求回调的时候，闭包可能不会被调用。原因是可能被释放， 或者可能被修改。
//
//如果需要保证做到异步的调用，那么需要在闭包的参数前加 @escaping标记。
//
//添加@escaping标记的闭包，意味着，如果需要访问自身的自身的变量的时候，必须在闭包内包含自身的引用（或者自身的属性、变量等）。
//
//下面是两种是否带标签的闭包的对比：
//var completions: [() -> Void] = []
//func someEscapingClosure(completionHandler: @escaping () -> Void) {
//    completions.append(completionHandler)
//
//func someEscapingClosure(closure: () -> Void) {
//    closure()
//}
//两者调用：
//class SomeClass {
//    var x = 10
//    func doSomething() {
//        someEscapingClosure { self.x = 100 }
//        someEscapingClosure { x = 200 }
//    }
//}

//当闭包作为参数传递给函数时，闭包被称为转义函数，在函数返回后调用。
//声明一个将闭包作为一个参数的函数时，可以在参数类型之前编写@escaping，以指示允许闭包被转义。

class someClass {
    var sjzBlock: () -> Void = {
        
    }
    
    func someEscapingFunc(com: @escaping () -> Void){
        print("执行函数")
        sjzBlock = com
    }
    
    func someNoneFunc(com: () -> Void){
        com()
    }
    var x = 10
    func doSomeThint() -> Void {
        someEscapingFunc {
            self.x = 20
        }
        someNoneFunc {
            x = 30
        }
    }
}
    
let some = someClass()
some.doSomeThint()
print(some.x)
    
some.sjzBlock()
print(some.x)
//用@escaping标记一个闭包意味着你必须在闭包中self引用。 例如，someEscapingFunc的闭包是一个转义闭包，这意味着它需要self引用。 相反，封闭传递给someNoneFunc是一个非转义的闭包，这意味着它可以隐式引用。
//@escaping和@non-escaping修饰符是用来修饰闭包的。闭包默认为@non-escaping类型@escaping：转义闭包，闭包的生命周期不在传入的函数范围内管理。由函数外部变量持有。当函数结束之后，闭包才去执行@non-escaping：闭包在函数内执行完后，函数才去执行，闭包销毁。当使用@escaping时，要考虑self被循环引用。

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

//MARK: 、Swift中闭包的循环引用
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
//
//Dog类

import Cocoa

class sjzDog: NSObject {
    var eatFull: ((String) -> Void) = {(String) in
        
    }
    var food: String?
    
    override init() {
        super.init()
    }
    
    deinit {
        print("狗挂了")
    }
    
    func eat(food: String, by: @escaping (String) -> Void) -> Void {
        self.food = food
        print("我吃了：\(food)")
        eatFull = by
    }
    
    func eatFinish() -> Void {
        eatFull(food!)
    }
    //在调用playOrFood方法后，将dog对象置空，dog对象不能释放，形成了循环引用
  //  原因：dog类引用了paly闭包，paly闭包又引用了dog类。解决方法和上面dog类和people互相引用类似
    var play: (() -> Void)?
    func playOrFood() -> Void {
        play = { [weak self] in
            print("我要玩, 我不想吃 \(String(describing: self!.food))")
        }
        play!()
    }
}

//People类

import Cocoa

class sjzPeople: NSObject {
    let dog: sjzDog
    var name: String?
    
    init(name: String) {
        self.name = name
        dog = sjzDog()
        
        super.init()
    }
    
    deinit {
        print("人挂了")
    }
    
    func feed(food: String) -> Void {
        //        循环应用
        //        输出：
        //        我吃了：milk
        //        我吃了milk, 我吃饱了,我想和主人Tom玩耍
        //        dog.eat(food: food) { (a) in
        //            print("我吃了\(a), 我吃饱了,我想和主人\(self.name!)玩耍")
        //        }
        
        
        /*以下输出：
         我吃了：milk
         我吃了milk, 我吃饱了,我想和主人Tom玩耍
         人挂了
         狗挂了
         */
        //        1. 解决循环引用
        //        weak var weakSelf = self
        //        dog.eat(food: food) { (a) in
        //            print("我吃了\(a), 我吃饱了,我想和主人\(weakSelf!.name!)玩耍")
        //        }
        
        //        2. 解决循环引用
        //        dog.eat(food: food) { [unowned self] (a) in
        //            print("我吃了\(a), 我吃饱了,我想和主人\(self.name!)玩耍")
        //        }
        
        //        3. 解决循环引用
        dog.eat(food: food) { [weak self] (a) in
            print("我吃了\(a), 我吃饱了,我想和主人\(self!.name!)玩耍")
        }
        
        dog.eatFinish()
    }
}

var people: sjzPeople? = sjzPeople.init(name: "Tom")
people!.feed(food: "milk")
people = nil

//循环引用原因：
//dog类中引用了闭包eatFull，people类中引用了dog类，闭包eatFull又引用了people，形成了闭环

//解决方法：

//weak var weakSelf = self，使用weakSelf调用属性
//在闭包{和参数之间使用[unowned self]
//在闭包{和参数之间使用[weak self]
//weak表示可用范围内self为弱引用unowned表示可用范围内self都为assign，不会强引用，如果对象释放，指针地址依然存在，不安全


