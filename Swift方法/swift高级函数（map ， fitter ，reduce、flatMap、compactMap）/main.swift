//
//  main.swift
//  swift高级函数（map ， fitter ，reduce、flatMap、compactMap）
//
//  Created by chaomeng on 2019/4/2.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// MARK: map函数
// 获取一个闭包表达式作为其唯一的参数， 数组中的每一个元素调用一次该闭包函数，并返回该元素所映射的值，简单说就是数组中的每个元素通过某个方法进行转换，最后返回一个新的数组

// 1 . 将数组中的int 转化成字符串金额
let prices  = [20 , 30 , 40 ]
let strs = prices.map { "$\($0)"}
print(strs)

// 2 ,对数组中的数进行o平方
let values = [4 ,6 ,8]
let squares = values.map {$0 * $0}
print(squares)

// MARK: flatMap 函数
// flatMap 方法同map类似 ， 不过它返回的数组不存在nil（自动把nil给剔除掉），同时它会把Optional解包
// 1. 比较方法
let array = ["Apple" , "Orange" , "Grape" , ""]

let arr1 = array.map { a -> Int? in
    let length  =  a.count
    guard length > 0 else {return nil}
    return length
}
print("arr1 \(arr1)")

let arr2 = array.compactMap { a -> Int? in
    let length = a.count
    guard length > 0 else {return nil}
    return length
}
print("arr2 \(arr2)")

// 2 flatMap 可以把多维数组一同打开变成一个新的数组
let array1 = [[1, 2, 3] , [4 ,5 ,6 ] , [7 , 8 ,9]]
let arr3 = array1.map( {$0} )
print("arr3 \(arr3)")
let arr4 = array1.flatMap { $0 }
print("arr4 \(arr4)")

// MARK: fitter 函数
// fitter方法用于过滤元素 ， 即筛选出数组中满足某种条件的元素
// 1
let price2 = [20 , 30 , 40]
let result = price2.filter { $0 > 25}
print(result)

// MARK:  reduce函数
// reduce 方法把数组元素组合计算一个值，并且会接受一个初始值，这个初始值的类型可以和数组元素类型不同
// 1 将数组中的金额想加，计算总和
let price3  = [20 , 30 ,40]
let sum = price3.reduce(0) { $0 + $1}
//可简化
let sum2 = price3.reduce(0 , +)

print(sum)

// 将数组转成字符串，每个元素使用（，）隔开
let array3 = ["Apple" , "Orange" , "Grape"]
let str = array3.reduce("") {
    return $0 == "" ? $1 : $0 + "," + $1
}
print(str)
// 可简写
let str2 = array3.joined(separator: ",")
print(str2)

// MARK: joined 函数
// 将集合里的元素通过指定链接内容连接起来
let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let joined = nestedNumbers.joined(separator: [-1, -2])
print(Array(joined))

// MARK: 高阶函数的组合使用，链式调用
// 组合使用
//flatMap 配合 filter 将多维整型数组里面的偶数筛选出来并且组合成了一个一维数组
let  collections = [[5 , 2, 6 ] , [4 ,8 ] , [9 ,1 ,3]]
let onlyEven = collections.flatMap {
    $0.filter({
        $0 % 2 == 0
    })
}
print("onlyEven \(onlyEven)")
// map 配合 reduce 计算二维数组里每个分组的总和。
let sums = collections.map {
    $0.reduce(0, +)
}
print("sums  \(sums)")

// 链式组合
// 1 将数组中大于7的所有数字进行求和操作
let marks = [ 4 , 5, 8 ,2, 9 ,7]
let totalPass = marks.filter {
    $0 > 7
}.reduce(0, +)
print("totalPass  \(totalPass)")

// 2 对数组里面的数字进行平方操作然后在筛选出偶数值
let evenSquares  = marks.map{$0 * $0}.filter {
    $0 % 2 == 0
}
print("evenSquares  \(evenSquares)")














