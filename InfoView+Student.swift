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
        nameLabel.text = student.name
        scoreLabel.text = String(student.average)
        showIndictorButton.setTitle("showIndictor", for: .normal)
    }
    
    
}
