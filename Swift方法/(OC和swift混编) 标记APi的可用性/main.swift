//
//  main.swift
//  (OC和swift混编) 标记APi的可用性
//
//  Created by chaomeng on 2019/5/16.
//  Copyright © 2019 TangHan. All rights reserved.
//

import Foundation

//在Swift中，您可以使用该@available属性来控制在为特定目标平台构建应用程序时是否可以使用声明。同样，您可以使用可用性条件#available根据所需的平台和版本条件有条件地执行代码。Objective-C中也提供了两种可用性说明符。

//标记可用性
//使用宏在Objective-C中添加可用性信息：API_AVAILABLE
//
//@interface MyViewController : UIViewController
//- (void) newMethod API_AVAILABLE(ios(11), macosx(10.13));
//@end
//这相当于@available在Swift中使用声明属性：

@available(iOS 11, macOS 10.13, *)
func newMethod() {
    // Use iOS 11 APIs.
}
//检查可用性
//使用@available()关键字检查Objective-C中条件语句中的可用性信息：

//if (@available(iOS 11, *)) {
//    // Use iOS 11 APIs.
//} else {
//    // Alternative code for earlier versions of iOS.
//}
//这相当于Swift中的以下条件：

if #available(iOS 11, *) {
    // Use iOS 11 APIs.
} else {
    // Alternative code for earlier versions of iOS.
}
