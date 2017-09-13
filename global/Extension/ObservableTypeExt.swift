//
//  ObservableTypeExt.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/31.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import RxSwift

// subscribe 的语法糖
extension ObservableType {
//    public func subscribe(file: String = #file, line: UInt = #line, function: String = #function, onNext: @escaping ((Self.E) -> Swift.Void)) -> Disposable {
//        return self.subscribe(file: file, line: line, function: function, onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil)
//    }
//    
//    public func subscribe(file: String = #file, line: UInt = #line, function: String = #function, onError: @escaping ((Error) -> Swift.Void)) -> Disposable {
//        return self.subscribe(file: file, line: line, function: function, onNext: nil, onError: onError, onCompleted: nil, onDisposed: nil)
//    }

//    public func subscribe(file: String = #file, line: UInt = #line, function: String = #function, onCompleted: @escaping (() -> Swift.Void)) -> Disposable {
//        return self.subscribe(file: file, line: line, function: function, onNext: nil, onError: nil, onCompleted: onCompleted, onDisposed: nil)
//    }
//
//    public func subscribe(file: String = #file, line: UInt = #line, function: String = #function, onDisposed: @escaping (() -> Swift.Void)) -> Disposable {
//        return self.subscribe(file: file, line: line, function: function, onNext: nil, onError: nil, onCompleted: nil, onDisposed: onDisposed)
//    }
    
//    public func `do`(onNext: ((Self.E) throws -> Swift.Void)?, onError: ((Error) throws -> Swift.Void)?, onCompleted: (() throws -> Swift.Void)?, onSubscribe: (() -> ())?, onSubscribed: (() -> ())?, onDispose: (() -> ())?) -> RxSwift.Observable<Self.E> {
//        return self.do(onNext: onNext, onError: onError, onCompleted: onCompleted, onSubscribe: onSubscribed, onSubscribed: onSubscribe, onDispose: onDispose)
//    }
    
    public func `do`(onNext: @escaping (Self.E) throws -> Swift.Void) -> RxSwift.Observable<Self.E> {
        return self.do(onNext: onNext, onError: nil, onCompleted: nil, onSubscribe: nil, onSubscribed: nil, onDispose: nil)
    }
    
}

extension ObserverType {
//        public func takeWhile(_ predicate: @escaping (Self.E) throws -> Bool) -> RxSwift.Observable<Self.E>
//    public func onErrorWhile(_ predicate:
}

//extension ObserverType {
//    func flatMapResultLast<O, T>(_ selector: @escaping (Self.E) throws -> O) -> RxSwift.Observable<O.E> where O : ObservableConvertibleType, Self.E: Result<T, <#Error: Error#>> {
//        self.flatMapLatest({
//            $0.analysis(ifSuccess: {
//                selector($0)
//            }, ifFailure: {
//                Observable.just(Result(error: $0))
//            })
//        })
//    }
//}


