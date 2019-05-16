//
//  main.swift
//  nullable和nonnull
//
//  Created by chaomeng on 2019/5/15.
//  Copyright © 2019 TangHan. All rights reserved.
//

import Foundation

//在swift中，可以使用!和?来表示一个对象是optional的还是non-optional，如view?和view!。而在Objective-C中则没有这一区分，view即可表示这个对象是optional，也可表示是non-optioanl。
//
//这样就会造成一个问题：在Swift与Objective-C混编时，Swift编译器并不知道一个Objective-C对象到底是optional还是non-optional，因此这种情况下编译器会隐式地将Objective-C的对象当成是non-optional。
//
//为了解决这个问题，苹果在Xcode 6.3引入了一个Objective-C的新特性：nullability annotations。
//
//这一新特性的核心是两个新的类型注释：__nullable和__nonnull。从字面上我们可以猜到，__nullable表示对象可以是NULL或nil，而__nonnull表示对象不应该为空。当我们不遵循这一规则时，编译器就会给出警告。

// 官方解释
// 在oObjective-C中，通过使用可以为null的指针来处理对象的引用， nil在Objective-C中调用，在swift中，所有值（包括对象实例）都保证为非null，相反，表示在可选类型中包含的值可能会丢失，当需要指示缺少值， 请使用该值nil

// 在Objective-C中， 注释声明，以指示实例是否可以具有null或nilvalue ，

// OC 实例
//@interface MyList : NSObject
//- (MyListItem *)itemWithName:(NSString *)name;
//- (NSString *)nameForItem:(MyListItem *)item;
//@property (copy) NSArray<MyListItem *> *allItems;
//@end

// swift 实例 将每个对象实例参数，返回值和属性导入为隐式包装的可选项：
class MyList: NSObject {
    func item(withName name: String!) -> MyList!{
        return self
    }
    func name(for item: MyList!) -> String!{
        return ""
    }
    var allItems: [MyList]!
}

//您可以在Objective-C代码中使用可空性注释来指定参数类型，属性类型或返回类型是否可为空。
// 以下是关于OC几个返回类型的解释

//Nonnullable - 作为nonoptionals导入，无论是直接注释还是包含在带注释的区域中

//Nullable-作为选项导入

//没有可空性注释或使用null_resettable注释 - 导入为隐式解包的选项

// OC 实例
//@interface MyList : NSObject
//- (nullable MyListItem *)itemWithName:(nonnull NSString *)name;
//- (nullable NSString *)nameForItem:(nonnull MyListItem *)item;
//@property (copy, nonnull) NSArray<MyListItem *> *allItems;
//@end

// swift 实例
class MyList1: NSObject {
    func item(withName name: String) -> MyList1?{
        return self
    }
    func name(for item: MyList1) -> String?{
        return ""
    }
    var allItems: [MyList1] = []
}

// 您可以通过将整个区域标记为可空性审核来简化注释Objective-C代码的过程。可以使用以下宏
//NS_ASSUME_NONNULL_BEGIN  NS_ASSUME_NONNULL_END

// OC 实例
//NS_ASSUME_NONNULL_BEGIN
//
//@interface MyList : NSObject
//- (nullable MyListItem *)itemWithName:(NSString *)name;
//- (nullable NSString *)nameForItem:(MyListItem *)item;
//@property (copy) NSArray<MyListItem *> *allItems;
//@end
//
//NS_ASSUME_NONNULL_END
