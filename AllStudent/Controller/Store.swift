//
//  Store.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation

class Store {
    
    internal private(set) var students: [Student]!
    
    init() {
        self.students = self.redStore()
    }
    
    deinit {
        self.store()
    }
    
    func item(at indexPath: IndexPath) -> Student {
        return students[indexPath.row]
    }
    
    // 读取缓存
    func redStore() -> [Student] {
        let student1 = Student(name: "陈东", math: 90, chinese: 90, english: 90)
        let student2 = Student(name: "王老", math: 80, chinese: 80, english: 80)
        let student3 = Student(name: "马龟", math: 70, chinese: 70, english: 70)
        let students = [student1, student2, student3]
        return students
    }
    
    // 缓存数据
    func store() {
        
    }
    
    func refresh(success: Student.StudentsBlock, fail: VoidBlock) {
        NetworkAPI().getAllStudent(success: {
            self.students = $0
            success($0)
        }, fail: fail)
    }
}

