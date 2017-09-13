//
//  Store.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Result

func delay(_ timeInterval: TimeInterval, block: @escaping VoidBlock) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval, execute: block)
}

class Store {
    
    internal private(set) var studentsVar = Variable([Student]())
    
    init() {
        self.redStore()
    }
    
    deinit {
        self.store()
    }
    
    // 读取缓存
    func redStore() {
        let students = [student1, student2, student3]
        studentsVar.value = students
    }
    
    // 缓存数据
    func store() {
        
    }
    
    
    // 刷新
    var refreshSingle: Observable<Result<Void, RefreshDataFail>> {
        return NetworkAPI().allStudentSingle
            .map({
                $0.map({
                    self.studentsVar.value = $0
                    return
                })
            })
    }

}

extension Store {
    func item(at indexPath: IndexPath) -> Student {
        return studentsVar.value[indexPath.row]
    }
    
    func item(at index: Int) -> Student {
        return studentsVar.value[index]
    }
}
