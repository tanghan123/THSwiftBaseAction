//
//  main.swift
//  Range的理解和代码
//
//  Created by chaomeng on 2019/2/27.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// 理解和区分不同的Range

//1. CountableClosedRange  可数的闭区间

let range1 = 0...2
// 可以for循环
for i in range1
{
    print("range2\(i)")
}

//2. CountableRange: 可数的开区间
let range2 = 0..<2
// 可以for循环
for i in range2 {
    print("range2\(i)")
}

//3.ClosedRange  不可数的闭区间
let range3 = 0.1...2.1
// 不可数，不能for循环，以下写法会报错
//for i in range3 {
//    print(i)
//}

// 4 Range 不可数的开区间
let range4 = 0.1..<2.1

// 不可数，不能for循环，以下写法会报错
//for i in range4 {
//    print(i)
//}
