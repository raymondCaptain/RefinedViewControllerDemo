//
//  StudentCell+ConfigureForStudent.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

extension StudentCell: ConfigureCell {
    func configure(for item: Student) {
        self.textLabel?.text = item.name
        self.averageLabel.text = String(item.average)
    }
}
