//
//  main.swift
//  字典（Dictionary）
//
//  Created by chaomeng on 2019/5/6.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

// MARK: 创建一个字典
// 创建一个空字典
let dic:Dictionary<String, Any> = Dictionary.init()
print(dic)
// 预分配指定数量空间
let dic1:Dictionary<String, Any> = Dictionary.init(minimumCapacity: 5)
//
let words = ["one" , "two" , "three" , "four" ,"five"]
var dic2 = Dictionary.init(uniqueKeysWithValues: zip(words ,1...5))
print("dic2\(dic2)")

//MARK: 检查字典
// 字典是否为空
print("empty\(dic2.isEmpty)")

//键值值对的个数
print("count\(dic2.count)")

//字典分配的存储的总数
print("capacity\(dic1.capacity)")

// MARK: 访问键值对

// 使用给定值来读写
print("one \(dic2["one"] ?? 0)")

// 使用给定值读写，若访问失败，则使用默认值 ,
print("two \(dic2["two" ,default:10])")

// 获取给定值的索引
let index = dic2.index(forKey: "three")!
print("index \(dic2[index].value) : \(dic2[index].key)")

// 访问指定位置的键值对
let subIndex = dic2[index]
print("subIndex \(subIndex.value) : \(subIndex.key)")

// 字典键的集合
print("keys \(dic2.keys)")

// 字典值的集合
print("value \(dic2.values)")

// 集合的第一个元素
print("first \(dic2.first!)")

// 随机元素
print("random \(dic2.randomElement()!)")

// MARK: 添加键值对

// 更新存储给定的值，存在返回value，不存在就新增但返回的vlue为nil
print("update \(String(describing: dic2.updateValue(7, forKey: "seven")))")

print("update \(dic2.updateValue(7, forKey: "four")!)")
print("update dic \(dic2)")

// 合并字典，去除重复部分
// 合并字典Value不会改变

print("merge current \(dic2.merge(["four" : 5 , "six" : 6]) { (current, _) in current})")
print("merge \(dic2)")

// 合并字典Value会改变同步 ,确定任何重复键的值。
print("merge new \(dic2.merge(["four" : 5 , "six" : 6]) { (_, new) in new})")
print("merge \(dic2)")
//  一系列键值对合并字典
print("merge new \(dic2.merge(zip(["nine"], [9])) { (_, new) in new})")
print("merge \(dic2)")

//
var dic3 = ["four" : 7 , "six" : 8]
// 合并字典Value不会改变
print("merging \(dic2.merging(dic3) { (current, _) in current})")
// 合并字典Value会改变同步 ,确定任何重复键的值。
print("merging \(dic2.merging(dic3) { (_, new) in new})")

// 充值字典分配的存储数量
print(dic3.reserveCapacity(10))

// MARK: 删除键和值

//给定谓语条件，生成新字典
print("filter \(dic2.filter { (key ,value) -> Bool in return value > 1 })")

// 删除指定键值对
print("removeValue  \(String(describing: dic2.removeValue(forKey: "five")!))")

// 移除指定索引键值对
print("remove \(dic2.remove(at: (((dic2.index(forKey: "four") ?? nil) ?? nil) ?? nil)!))")

// 移除所有键值对
//print("removeAll \(dic2.removeAll(keepingCapacity: true))")

// MARK: 比较字典 注 : 当Value符合Equatable时可用。
let dic4 = ["age":23 , "name" : 30]
let dic5 = ["age":2 , "name" : 30]
print("bool \(dic4 == dic5)")
print("bool \(dic4 != dic5)")

// MARK: 循环键和值
// 循环
dic2.forEach { (key ,value) in
    print("key \(key) value \(value)")
}

//返回一对（n，x）序列，其中n表示从零开始的连续整数，x表示序列的元素
for (index , value) in  dic2.lazy.enumerated() {
    print("index \(index) , value \(value)")
}
// 暂定
print("makeIterator \(dic2.makeIterator())")

// 小于或等于集合中元素数量的值。
print("underestialtedCount \(dic2.underestimatedCount)");

// MARK: 寻找元素

// 返回一个布尔值，指示序列是否包含满足给定谓词的元素。
let iscontains =  dic2.contains { (key , value) -> Bool in
    return value > 5
}
print("contains \(iscontains)")

// 返回一个布尔值，指示序列的每个元素是否满足给定谓词。
let isSatisfy = dic2.allSatisfy { (key , value) -> Bool in
    return value < 5
}
print("allSatisfy \(isSatisfy)")
// 返回集合元素满足给定谓词的第一个索引。
let firstS = dic2.first { (key , value) -> Bool in
    return value > 6
}
print("firsts \(firstS!)")

//返回序列中的最小元素，使用给定谓词作为元素之间的比较。
let min = dic2.min { (min1, min2) -> Bool in
    print("min1 \(min1) , min2 \(min2)")
    return min1.value <  min2.value
}
print("min \(min!)")
//返回序列中的最大元素，使用给定谓词作为元素之间的比较。
let max = dic2.max { (max1, max2) -> Bool in
    print("max1 \(max1) , max2 \(max2)")
    return max1.value <  max2.value
}
print("max \(max!)")

// MARK: 转换字典
//其中包含此字典的键，其中包含由给定闭包转换的值。
var dic6:[String:Any] = ["name" : "jacob" , "age" : 32 , "high" : 190]
let mapValue = dic6.mapValues { (value) -> Any in
    return 44
}
print("mapValue\(mapValue)")

//给定闭包组合序列元素的结果 ,计算元素的和，注：不过需要类型统一
var dic7:[String:Int] = ["name" : 21 , "age" : 32 , "high" : 190]
let reduce =  dic7.reduce(0) { (x, item) -> Int in
    print("x \(x) ,item \(item)")
    return item.value + x
}
print("reduce \(reduce)")
//返回使用给定闭包组合序列元素的结果。
//initialResult
//指定返回类型，使用初始值
//
//updateAccumulatingResult
//一个闭包，用序列元素更新累积值。
let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}
print("letterCount \(letterCount)")
//返回一个数组，其中包含在序列元素上映射给定闭包的结果。
let maps =  dic6.map { item -> Any in
    return item.key
}
print("maps \(maps)")
//返回一个数组，其中包含nil使用此序列的每个元素调用给定转换的非结果。
let mapacts = dic6.compactMap { item -> Any? in
     return item.value
}
print("mapacts \(mapacts)")

//返回一个新字典，该字典仅包含具有非nil值的键值对，作为给定闭包转换的结果。
let compactDic = dic6.compactMapValues { (value) -> Any? in
    return value
}
print("compactDic \(compactDic)")

//返回一个数组，其中包含使用此序列的每个元素调用给定转换的连接结果。
let flats = dic6.compactMap { (item) -> Any? in
    return item.value
}
print("flats \(flats)")
//给定的谓词作为元素之间的比较进行排序
let sort =  dic6.sorted { (item1, item2) -> Bool in
    return item1.key < item2.key
}
print("sort \(sort)")

// 随机排序
print("shuffled \(dic6.shuffled())")
