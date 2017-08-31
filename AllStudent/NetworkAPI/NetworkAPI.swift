//
//  NetworkAPI.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

struct NetworkAPI {    
    // 伪网络请求：获取所有学生
    func getAllStudent(success: Student.StudentsBlock, fail: VoidBlock) {
        let student1 = Student(name: "陈东", math: 90, chinese: 90, english: 90)
        let student2 = Student(name: "王老", math: 80, chinese: 80, english: 80)
        let student3 = Student(name: "马龟", math: 70, chinese: 70, english: 70)
        let students = [student1, student2, student3]
        success(students)
        fail()
        return
    }
}
