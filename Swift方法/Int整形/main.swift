//
//  main.swift
//  Int整形
//
//  Created by chaomeng on 2019/2/26.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation
//在32位的平台，Int其大小与相同Int32，和在64位的平台，Int其大小与相同Int64
let num = 0

print(num)
//
var num0 = Int(bigEndian: num)
print(num0)

//使用与给定值相同的内存表示创建新实例。
let num3 = Int(bitPattern: 5)
print(num3)

//如果需要适合此类型，则通过截断或符号扩展从给定实例的位模式创建新实例
let num4 = Int(truncatingIfNeeded: 10)
print(num4)

//使用最接近给定整数的可表示值创建新实例
let num5 = Int(clamping: 12)
print(num5)
//如果可以精确表示，则从给定的整数创建新实例。
let num6 = Int(exactly: 13)
print(num6 ?? 0)

//
let num7 = Int(exactly: 15.6)
print(num7 ?? 0)

//根据给定的浮点值创建一个整数，向零舍入。
let num77 = Int(17.7)
print(num77)


// MARK: 转换字符串

//从给定字符串创建一个新的整数值。
let str  = "43"
let num1 = Int(str)
print(num1!)
let str1 = "reer"
let num11 = Int(str1)
print(num11 ?? "")

//进制之间转换 就是根据给定的字符串和基数创建一个新的整数值。
//text 代表本身10进制数，intd代表需要转的进制
let num8 = Int("1000", radix: 10)
print(num8 ?? 0)

// MARK: 创建随机整数
//返回指定范围内的随机值。闭区间
var num9 = Int.random(in: 0...10)
print(num9)
//返回指定范围内的随机值。开区间
var num10 = Int.random(in: 0..<10)
print(num10)

//使用自定义随机数生成器时，使用此方法生成特定范围内的整数
// 需要在看下SystemRandomNumberGenerator
var g = SystemRandomNumberGenerator()
var num12 = Int.random(in: 0...40, using: &g)
print(num12)

// MARK: 计算数
// 将整数转为负数
var num13 = 130
num13.negate()
print(num13)
//将整数转为负数, 结果值必须可在值的类型中表示。特别是，否定有符号的固定宽度整数类型的最小值会导致无法表示的值。
var num14 = Int8.min
//num14.negate()
//print(num14)

/// 返回此值的商和余数除以给定值。
let x = 1000000
let (q,r) = x.quotientAndRemainder(dividingBy: 933)
print("\(q),\(r)")

// MARK: 使用溢出执行计算

// 返回此值与给定值的总和，以及指示操作中是否发生溢出的布尔值。
// 溢出
let (num15,isBool) = Int.max.addingReportingOverflow(Int.max)
print("\(num15) , \(isBool)")
// 不溢出
let (num16,iBool) = 100000.addingReportingOverflow(333232)
print("\(num16) , \(isBool)")

// 下同
//返回通过从此值减去给定值获得的差值，以及指示操作中是否发生溢出的布尔值。
let (num17 , issubtracting) = 1000.subtractingReportingOverflow(1000)
//返回此值和给定值的乘积，以及指示操作中是否发生溢出的布尔值。
let (num18 , ismultiplied) = 1000.multipliedReportingOverflow(by: 1000)
//返回通过将此值除以给定值获得的商，以及指示操作中是否发生溢出的布尔值。
let (num19 , isdivided) = 1000.dividedReportingOverflow(by: 1000)
// 将此值除以给定值后返回余数，以及指示在除法期间是否发生溢出的布尔值。
let (num20 , isremainder) = 1000.remainderReportingOverflow(dividingBy: 1000)
//使用此方法计算否则会溢出的产品的完整结果。不同于传统的截断乘法时，方法返回包含两者的元组和该值的乘积的和零件
//
let (high , low) = 43.multipliedFullWidth(by: 1)
print("high = \(high) , low = \(low)")

let x1 : uint8 = uint8.max
let y1 : uint8 = uint8.max

let result  = x1.multipliedFullWidth(by: y1)
print("\(result.high) , \(result.low)")

let result2 = 1001.dividingFullWidth((high: 1000, low: 22))

print("\(result2.quotient) , \(result2.remainder)")

// magnitude对于任何数值x，是绝对值
var magn = -122
//这个值的大小。 也是绝对值
print(magn.magnitude)
//返回给定数字的绝对值。
print(abs(magn))
//-1如果此值为负且1如果为正，则返回; 否则，0。
var sig = -2132324223423

print(sig.signum())

//此类型中的最小可表示整数。
print(Int.max)
//此类型中的最大可表示整数。
print(Int.min)
//指示此类型是否为带符号整数类型。 此属性始终true用于有符号整数类型。
print(uint.isSigned);


