//
//  main.swift
//  swift 一些函数使用
//
//  Created by chaomeng on 2019/4/3.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// MARK: stride 循环
// stride 是 Strideable 协议中定义的一个方法， 它可以按照指定的递进值生成一个序列。可以用在 Swift 的循环语法结构中

// 1
var numbers = [10 , 20 , 30 , 40 ,50]

//stride(from: 60, through: 100, by: 10)
numbers.append(contentsOf: stride(from: 60, through: 100, by: 10))

print(numbers)

//MARK: 自定义下标(Subscript)

// class structures和enum都可以定义subscript ，subscirpt可以帮助我们更方便的访问或者设置一个集合中的某个成员 ，也是访问集合，列表或序列的成员元素
// 下标语法
//subscript(index :Int) -> Int{
//    get {
//        return index
//    }
//    set(newValue){
//
//    }
//}

// 例子
struct TimesTable {
    let multiplier :Int
    subscript(index :Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable)

print("six times three is \(threeTimesTable[6])")





