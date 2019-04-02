//
//  main.swift
//  String(字符串)
//
//  Created by chaomeng on 2019/3/15.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// MARK: 创建字符串

let  cStr = "cstr"

let cstr2 = String("gjsdjgf")

print("\(cStr) , \(cstr2)")

// 创建一个新字符串，表示重复指定次数的给定字符串。
let cstr3 = String(repeating: "1", count: 3)
print("ctr3  \(cstr3)")

//创建一个包含给定序列中字符的新字符串。
let cstr4 = "The rain in Spain stays mainly in the plain."

let cstr5: Set<Character> = ["a", "e", "i", "o", "u"]
let cstr6 = String(cstr4.lazy.filter { !cstr5.contains($0) })

let cstr7 = String(cstr4.filter({ !cstr5.contains($0) }))


print(cstr6)
//Th rn n Spn stys mnly n th pln.


// MARK: 检查字符串
//一个布尔值，指示字符串是否没有字符。
print(cstr6.isEmpty)
//字符串中的字符数。
print(cstr6.count)


// MARK: 从Unicode数据创建字符串

//Unicode.Scalar一个单一的Unicode标量值 ,只能定义一个字符
let uci = Unicode.Scalar("$")
let uStr = String(uci!)
print("uStr=\(uStr)")

//
var cchar:CChar = 0

let uStr2 = String(utf8String: &cchar)
print("ustr2==\(uStr2 ?? "9")")

let validUtf8 :[CChar] = [67, 97 , 102, -61 , -87]
validUtf8.withUnsafeBufferPointer { ptr in
    print(ptr.baseAddress ?? "")
    let s = String(validatingUTF8: ptr.baseAddress!)
    print(s ?? "")
    
    let s1 = String(utf8String: ptr.baseAddress!)
    print(s1 ?? "")
}

let invalieUtf8 : [CChar] = [67 , 70 ,40 ,-87 ,-89 ,0]
invalieUtf8.withUnsafeBufferPointer { ptr in
    let s = String(validatingUTF8: ptr.baseAddress!)
    print(s ?? "nil")
    
    let s1 = String(utf8String: ptr.baseAddress!)
    print(s1 ?? "nil")
    
}

let ustr3 = String(describing: 10)
print(ustr3)
// c
let ustr4 = String(reflecting: 11.0)
print(ustr4)

try ustr3.write(toFile: ustr4, atomically: true, encoding: String.Encoding.utf8)

print(try! ustr3.write(toFile: ustr4, atomically: true, encoding: String.Encoding.utf8))

//let ustr4  = String(utf16CodeUnitsNoCopy: <#T##UnsafePointer<unichar>#>, count: <#T##Int#>, freeWhenDone: <#T##Bool#>)

// MARK: 拼接字符串
print("拼接字符串")
var pstr1 = "my name is "
// 将序列或者集合的元素添加到末尾
pstr1.append(contentsOf: "tuig")
print(pstr1)

print("p  \(pstr1.appending("jacob"))")

