//
//  ResultExt.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/9/12.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import Result

extension ResultProtocol {
    public func mapError<NewError>(_ newError: NewError) -> Result<Value, NewError> {
        return mapError { _ in newError }
    }
}
