//
//  main.swift
//  swift关键字
//
//  Created by chaomeng on 2019/5/6.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// MARK: where关键字 设置约束条件，限制类型，让代码更加简洁，易读
// 1.可以使用Where关键在 switch，for...in 做条件限制
let scores = [20 , 8 , 59 ,70 , 80]
scores.forEach {
    switch $0 {
    case let x where x>=60:
        print("及格")
    default:
        print("不及格")
    }
}

// for
for socre in scores where socre >= 60 {
      print("这个是及格的：\(socre)")
}


// 2 do catch 使用

enum ExceptionError : Error {
    case httpCode(Int)
}

func throwError() throws {
    throw ExceptionError.httpCode(500)
}

do {
    try throwError()
}catch ExceptionError.httpCode(let httpCode) where httpCode >= 500{
    print("server error")
}catch{
    print("other error")
}

// 3 与协议结合

protocol aProtocol {}

extension aProtocol where Self:Sequence{
    
}
// 注意，过去if let guard 语句中的where现在都用，替代了
var  optionName:String? = "ceshi"
if let name = optionName ,name.hasPrefix("3") {
    print("\(name)")
}else{
    print("error")
}

// 4 swift4 改进
// 可以在associatedtype后面的声明类型后追加where约束语句
protocol MyProtocol {
    associatedtype Element
  //  associatedtype SubSequence : Sequence where SubSequence.Iterator.Element == Iterator.Element
}

//由于 associatedtype 支持追加 where 语句，现在 Swift 4 标准库中 Sequence 中 Element 的声明如下：
protocol Sequence {
   // associatedtype Element where Self.Element == Self.Iterator.Element
    // ...
}
//它限定了 Sequence 中 Element 这个类型必须和 Iterator.Element 的类型一致。原先 Swift 3 中到处露脸的 Iterator.Element，现在瘦身成 Element。
//比如我们对 Sequence 做个扩展，增加个 sum 方法（计算总和）：
//extension Sequence where Element: Numeric {
//    var sum: Element {
//        var result: Element = 0
//        for item  in self {
//            result += item
//        }
//        return result
//    }
//    print([1,2,3,4].sum)
//}

//同样地，SubSequence 也通过 where 语句的限定，保证了类型正确，避免在使用 Sequence 时做一些不必要的类型判断。
//protocol Sequence {
//    associatedtype SubSequence: Sequence
//        where SubSequence.SubSequence == SubSequence, SubSequence.Element == Element
//}

//除了 Sequence，Collection 同样新增了 where 语句约束。比如下面样例，我们扩展 Collection 时所需约束变得更少了。
// 在Swift 3时代, 这种扩展需要很多的约束:
//extension Collection where Iterator.Element: Equatable,
//    SubSequence: Sequence,
//    SubSequence.Iterator.Element == Iterator.Element
//
// 而在Swift 4, 编译器已经提前知道了上述3个约束中的2个, 因为可以用相关类型的where语句来表达它们.
extension Collection where Element: Equatable {
    func prefieIsEqualSuffix(_ n: Int) -> Bool {
        let head = prefix(n)
        let suff = suffix(n).reversed()
        return head.elementsEqual(suff)
    }
}

print([1,2,3,4,2,1].prefieIsEqualSuffix(2))

