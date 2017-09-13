//
//  InfoView+Student.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

extension InfoView {
    convenience init(student: Student) {
        self.init()
        self.uiConfigure(student: student)
    }
    
    private func uiConfigure(student: Student) {
        topTitleLabel.text = student.name
        subTitleOneLabel.text = "语文"
        firstTextField.text = String(student.chinese)
        subTitleTwoLabel.text = "数学"
        secondTextField.text = String(student.math)
        subTitleThreeLabel.text = "英语"
        threeTextField.text = String(student.english)
        button.setTitle("确定", for: .normal)
    }

}
