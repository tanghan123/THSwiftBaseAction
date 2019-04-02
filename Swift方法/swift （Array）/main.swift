//
//  main.swift
//  swift （Array）
//
//  Created by chaomeng on 2019/4/2.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

//MARK: 创建数组

let carr0  = Array<Int>()
// 使用区间创建数组
let carr1 = Array(1...7)
print(carr1)

//创建重复指定的次数的数组
let carr2 = Array(repeating: 1, count: 4)
print(carr2)

// MARK:检查数组
// 检查数组是否为空
print(carr0.isEmpty) // true
print(carr1.isEmpty) // false
// 数组中元素个数
print(carr1.count)
//
print(carr1.capacity)



