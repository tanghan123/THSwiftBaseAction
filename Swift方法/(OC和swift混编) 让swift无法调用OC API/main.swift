//
//  main.swift
//  (OC和swift混编) 让swift无法调用OC API
//
//  Created by chaomeng on 2019/5/16.
//  Copyright © 2019 TangHan. All rights reserved.
//

import Foundation

print("Hello, World!")

// MARK: 使用宏来防止在Swift中使用API​​。NS_SWIFT_UNAVAILABLE
//防止导入Objective-C API
//要防止导入Objective-C API中的声明，请将单个参数传递给宏。该参数指示使用Swift的开发人员应该做什么，而不是使用您不可用的API部分。NS_SWIFT_UNAVAILABLE
//

//在此示例中，Objective-C类提供了一个方便的初始值设定项，它为键值对获取可变参数，建议使用字典文字：
//
//    + (instancetype)collectionWithValues:(NSArray *)values
//forKeys:(NSArray<NSCopying> *)keys
//NS_SWIFT_UNAVAILABLE("Use a dictionary literal instead.");

//尝试在Swift中调用该方法会导致编译器错误。collectionWithValues:forKeys:
//

//使两种语言的API不可用
//要在Swift和Objective-C中在编译时使Objective-C声明不可用，请使用宏。宏的行为与宏类似，只是它不支持可自定义的错误消息，并且它限制了对Objective-C代码中声明的编译时访问。NS_UNAVAILABLENS_SWIFT_UNAVAILABLE
