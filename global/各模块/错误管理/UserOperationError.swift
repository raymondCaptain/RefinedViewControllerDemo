//
//  UserOperationError.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/9/1.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

//enum UserOperationError: Error {
//    case inputError
//}
//
//enum APIError: Error {
//    case refreshFail
//    case returnFalseFromServer
//}

// 不定义成枚举是因为：
// 1. 书写方便，不需要写 RefreshDataFail.refreshDataFail，这样写包含了不必要的信息
// 2. 可以添加更加详细的错误信息
// 3. 如果定义成枚举，在引用该错误的错误集中，需要考虑和解决所有情况或者会造成包含不相关的情况
struct RefreshDataFail: Error {
}

enum ChangeScoreError: Error {
    case inputError
    case changeScoreFail
    // 如果 RefreshDataFail 中包含了需要的错误信息可以这么写
    // 如果 RefreshDataFail 中没有需要的错误信息，就不需要关联 RefreshDataFail 的实例
    // 此时在代码中做个简单的错误转换就行了
    case refreshDataFail(RefreshDataFail)
}

//enum ZWError: Error {
//    case api(APIError)
//    case userOperation(UserOperationError)
//}
//
//
//enum ChangeScoreError: Error {
//    case userInputError()
//    case changeScoreFailed
//    case refreshDataFailed
//}
