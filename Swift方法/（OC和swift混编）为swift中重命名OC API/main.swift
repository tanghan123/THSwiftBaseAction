//
//  main.swift
//  （OC和swift混编）为swift中重命名OC API
//
//  Created by chaomeng on 2019/5/16.
//  Copyright © 2019 TangHan. All rights reserved.
//

import Foundation

// MARK: 使用宏来自定义Swift的API名称。NS_SWIFT_NAME

//重命名API
//下面的示例重命名一个类及其中一个属性：

//NS_SWIFT_NAME(Sandwich.Preferences)
//@interface SandwichPreferences : NSObject
//
//@property BOOL includesCrust NS_SWIFT_NAME(isCrusty);
//
//@end
//
//@interface Sandwich : NSObject
//@end

//将类及其属性被重命名为和对斯威夫特：SandwichPreferencesincludesCrustSandwich.PreferencesisCrusty

//var preferences = Sandwich.Preferences()
//preferences.isCrusty = true

//您使用宏作为类和协议的前缀。对于所有其他类型的声明（例如属性，枚举情况和类型别名），您可以使用宏作为后缀。以下示例使用宏作为后缀来重命名枚举：NS_SWIFT_NAME

//typedef NS_ENUM(NSInteger, SandwichBreadType) {
//    brioche, pumpernickel, pretzel, focaccia
//} NS_SWIFT_NAME(SandwichPreferences.BreadType);
