//
//  main.swift
//  swift （Array）
//
//  Created by chaomeng on 2019/4/2.
//  Copyright © 2019年 TangHan. All rights reserved.
//

import Foundation

//MARK: 创建数组
print("创建数组")
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

// MARK : 访问元素

print("访问元素")
let arr0 = [1 ,2 ,3, 4, 5, 6, 7, 8, 9]
// 通过下标访问元素
print(arr0[3])
// 获取集合的第一个元素
print(arr0.first!)
// 获取元素的最后一个元素
print(arr0.last!)
// 获取连续范围内数组元素
print(arr0[1...3])
//如何获取字符串数组的切片，查找切片中某个字符串的索引，然后在原始数组中使用该索引。
var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
let streetsSlice = streets[2 ..< streets.endIndex]
print(streetsSlice)
// Prints "["Channing", "Douglas", "Evarts"]"

let index = streetsSlice.firstIndex(of: "Evarts")    // 4
streets[index!] = "Eustace"
print(streets[index!])

// 获取集合的随机元素
print(arr0.randomElement() ?? 0)

// 返回集合的随机元素 ， 使用t特定的随机源
//let myGenerator = 2
//
//let mygenerator = RandomNumberGenerator()
//
//print(arr0.randomElement(using: &mygenerator))

// MARK: 添加元素
print("添加元素")
var arr1 =  ["a" , "b" ,"c" ,"d" ,"e" ,"f" ,"g" ,"h"]

print(arr1)
// 在数组末尾添加新元素
arr1.append("i")
print(arr1)

//在指定位置插入新元素
arr1.insert("j", at: 2)
print(arr1)

// 将序列的元素插入到指定的集合中
arr1.insert(contentsOf: ["k" ,"l" ,"m"], at: 5)
print(arr1)

// 用指定集合中的严肃替换一系列元素
arr1.replaceSubrange(0...3, with: ["n"])
print(arr1)
//用给定的集合替换指定的元素子范围
arr1.replaceSubrange(1...3, with: repeatElement("1", count: 5))
print(arr1)

// MARK: 数组拼接
var arr2 = [1 , 2, 3 , 4, 5, 6]
print(arr2)

// 将序列元素添加到数组的末尾
arr2.append(contentsOf: [7 , 8])
print(arr2)

// 使用计算符自己拼接

// 会生成一个新的集合
print(arr2 + [9 ,10])

// 直接拼接在数组后面
arr2 += [11 ,12]
print(arr2)
arr2 += [13 ,14]
print(arr2)

// MARK: 删除元素
print("删除元素")
var arr3 = [1 , 2, 3 , 4, 5, 6]
print(arr3)

//移除并返回指定位置元素
print(arr3.remove(at: 3))
print(arr3)

// 移除并返回第一个元素
print(arr3.removeFirst())
print(arr3)

//集合的开头删除置顶数量的元素
arr3.removeFirst(2)
print(arr3)

arr3 += [3 ,4 , 5, 6, 7, 8, 9, 10 ]

//删除并返回集合的最后一个元素。
print(arr3.removeLast())
print(arr3)

//从集合末尾删除指定数量的元素。
arr3.removeLast(2)
print(arr3)

//从集合中删除指定子范围中的元素。
arr3.removeSubrange(1...3)
print(arr3)

// 删除所有元素
arr3.removeAll()
print(arr3)

arr3 += [3 ,4 , 5, 6, 7, 8, 9, 10 ]
// 删除所有元素 ，保留s存储空间
arr3.removeAll(keepingCapacity: true)
print(arr3.capacity)
print(arr3)

arr3 += [3 ,4 , 5, 6, 7, 8, 9, 10 ]

// 删除并返回集合的最后一个元素。
print(arr3.popLast() ?? 0)


// MARK: 寻找元素
print("寻找元素")
var arr4 = [1 , 2, 3 , 4, 5, 6]
print(arr4)

// 是否包含给定元素
print(arr4.contains(4))

// 是否包含给定条件的元素
print(arr4.contains(where: { value -> Bool in
    return value > 3
}))

// 指定序列所有元素是否满足特定条件
print(arr4.allSatisfy({ value -> Bool in
    return value == 4
}))

// 满足给定条件的第一个元素
print(arr4.first(where: {$0 > 5 }) ?? 0)

// 指定值在集合出现的第一个索引
print(arr4.firstIndex(of: 4) ?? 0)

// 返回集合元素满足给定谓词的第一个索引。
print(arr4.firstIndex(where: { $0 > 1}) ?? 0)

// 满足给定条件的最后一个元素
print(arr4.last(where: {$0 > 5 }) ?? 0)

// 指定值在集合出现的最后一个索引
print(arr4.lastIndex(of: 4) ?? 0)

// 返回集合元素满足给定谓词的最后一个索引。
print(arr4.lastIndex(where: { $0 > 1}) ?? 0)

// 返回最小元素
print(arr4.min() ?? 0 )

//返回最小元素，使用指定条件进行比较
print(arr4.min(by: { a ,b -> Bool in
    return a < b
}) ?? 0)

// 返回最大元素
print(arr4.max() ?? 0 )

//返回最大元素，使用指定条件进行比较
print(arr4.max(by: { a ,b -> Bool in
    return a < b
}) ?? 0)

// MARK: 选择元素
print("选择元素")
var arr5 = [3, 1, 4 , 2, 5, 6]
print(arr5)

// 包含集合初始元素，直到指定的最大长度
print(arr5.prefix(3))

// 从集合开头到指定位置的序列
print(arr5.prefix(through: 4))

//从集合开头到(但不包括)指定位置的序列
print(arr5.prefix(upTo: 4))

// 包含初始元素，直到指定条件不符合并跳过其他元素
print(arr5.prefix(while: { $0 < 2}))

//从末尾的元素到指定最大长度的序列
print(arr5.suffix(4))

// 返回从指定位置到集合末尾的子序列。
print(arr5.suffix(from: 4))

// MARK: 排除元素
print("排除元素")
var arr6 = [3, 1, 4 , 2, 5, 6]
print(arr6)

// 返回包含除指定数量的最终元素之外的所有子序列的子序列。
print(arr6.dropLast(2))

// 返回最终初始元素之外的所有子序列的子序列
print(arr6.dropLast())

// 返回第一初始元素之外的所有子序列的子序列
print(arr6.dropFirst())

//返回包含除给定数量的初始元素之外的所有子序列的子序列
print(arr6.dropFirst(3))

//通过在predicate返回时跳过元素true并返回其余元素来返回子序列
print(arr6.drop(while: {$0 > 9}))

// MARK: 循环数组的元素
print("循环数组的元素")
var arr7 = [3, 1, 9 , 2, 5, 8]
print(arr7)

// 按顺序循环数组 ， 您不能使用breakor continue语句退出当前的body闭包调用或跳过后续调用。，使用闭包中的return语句body将仅从当前调用退出body，而不是从任何外部作用域退出，并且不会跳过后续调用。
arr7.forEach { value in
    print(value)
}

//返回一对（n，x）序列，其中n表示从零开始的连续整数，x表示序列的元素。
for (n ,c) in arr7.enumerated()
{
    print("n \(n) ,c \(c)")
}
//返回按顺序的指定元素
for n in arr7.makeIterator()
{
    print(n)
}
//小于或等于集合中元素数量的值
print(arr7.underestimatedCount)

// MARK: 数组排序
print("数组排序")
var arr8 = [3, 1, 9 , 2, 5, 8]
print(arr8)

// 对集合按升序排列
arr8.sort()
print(arr8)

//使用给定的谓词作为元素之间的比较，对集合进行排序
arr8 = [3, 1, 9 , 2, 5, 8]
arr8.sort { (a, b) -> Bool in
    a > b
}
print(arr8)

//对集合按升序排列
arr8 = [3, 1, 9 , 2, 5, 8]
print(arr8.sorted())
//返回序列的元素，使用给定的谓词作为元素之间的比较进行排序。
arr8 = [3, 1, 9 , 2, 5, 8]
print(arr8.sorted(by: >))

//
arr8 = [3, 1, 9 , 2, 5, 8]
arr8.reverse()
print(arr8)

// 将元素反转得到新的元素
let word = "Backwards"
for char in word.reversed() {
    print(char, terminator: "")
}

// 将数组随机排序
arr8.shuffle()
print(arr8)

print(arr8.shuffled())
