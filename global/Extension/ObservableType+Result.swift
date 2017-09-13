//
//  ObservableType+Result.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/9/11.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import RxSwift
import Result

extension ObservableType {
    
    func flatMapResultLatest<ResultValue, NewValue, Err>(_ selector: @escaping (ResultValue) -> Observable<Result<NewValue, Err>>) -> Observable<Result<NewValue, Err>> where Self.E == Result<ResultValue, Err> {
        return self.flatMapLatest({
            $0.analysis(ifSuccess: { selector($0) }, ifFailure: {
                Observable.just(Result(error: $0))
            })
        })
    }
    
    func mapResultError<ResultValue, Err: Error, NewErr: Error>(_ newError: NewErr) -> Observable<Result<ResultValue, NewErr>> where Self.E == Result<ResultValue, Err> {
        return self.map({ $0.mapError(newError) })
    }
    
    func mapResultError<ResultValue, Err: Error, NewErr: Error>(_ transducer: @escaping (Err) -> NewErr) -> Observable<Result<ResultValue, NewErr>> where Self.E == Result<ResultValue, Err> {
        return self.map({ $0.mapError(transducer) })
    }
    
    func subscribeReuslt<ResultValue, Err: Error>(onSuccess: @escaping (ResultValue) -> Void, onFailure: @escaping (Err) -> Void) -> Disposable where Self.E == Result<ResultValue, Err> {
        return self.subscribe(onNext: {
            $0.analysis(ifSuccess: onSuccess, ifFailure: onFailure)
        })
    }
    
    func resolveResultError<ResultValue, Err: Error>(_ handler: @escaping (Err) -> Void) -> Observable<ResultValue> where Self.E == Result<ResultValue, Err> {
        return self.flatMap({
            $0.analysis(ifSuccess: { Observable.just($0) }, ifFailure: {
                handler($0)
                return Observable.empty()
            })
        })
    }
//    func `do`<ResultValue, Err: Error>(onFailure fail: @escaping VoidBlock) -> Self where Self.E == Result<ResultValue, Err> {
////        return Observable.empty()
//        self.flatMapLatest({ _ -> Observable<Result<ResultValue, err>> in
//            return self
//        })
////        return Observable.just(1)
//        
////        return self.flatMapLatest({
////            return Observable.just($0)
////        })
//    }
//    
    
}
