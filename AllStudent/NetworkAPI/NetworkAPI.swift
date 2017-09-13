//
//  NetworkAPI.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Result

var student1 = Student(id: "1", name: "陈东", math: 90, chinese: 90, english: 90)
var student2 = Student(id: "2", name: "王老", math: 80, chinese: 80, english: 80)
var student3 = Student(id: "3", name: "马龟", math: 70, chinese: 70, english: 70)

struct NetworkAPI {
    // 伪网络请求：获取所有学生
    var allStudentSingle: Observable<Result<[Student], RefreshDataFail>> {
        return Observable.create { observer in
            let students = [student1, student2, student3]
            observer.onNext(Result(value: students))
//            observer.onNext(Result.failure(RefreshDataFail()))
            return Disposables.create()
        }.retry(2)
    }
    
    func changeScore(forStudent studentId: String, allScore: [Double]) -> Observable<Result<Void, ChangeScoreError>> {
        // 伪网络请求：修改学生分数
        return Observable.create({ observer in
            if studentId == student1.studentId {
                student1.chinese = allScore[0]
                student1.math = allScore[1]
                student1.english = allScore[2]
            } else if studentId == student2.studentId {
                student2.chinese = allScore[0]
                student2.math = allScore[1]
                student2.english = allScore[2]
            } else if studentId == student3.studentId {
                student3.chinese = allScore[0]
                student3.math = allScore[1]
                student3.english = allScore[2]
            }
//            observer.onNext(Result.init(error: ChangeScoreError.changeScoreFail))
            observer.onNext(Result.init(value: ()))
            return Disposables.create()
        }).retry(2)
    }
}
