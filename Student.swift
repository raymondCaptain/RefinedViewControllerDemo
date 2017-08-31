//
//  Student.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

struct Student {
    
    typealias StudentsBlock = ([Student]) -> Void

    var name: String
    var math: Double
    var chinese: Double
    var english: Double
    
    init(name: String, math: Double, chinese: Double, english: Double) {
        self.name = name
        self.math = math
        self.chinese = chinese
        self.english = english
    }
}


