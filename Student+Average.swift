//
//  Student+Average.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

extension Student {
    var average: Double {
        let score = [math, chinese, english]
        return score.reduce(0, +) / Double(score.count)
    }
}
