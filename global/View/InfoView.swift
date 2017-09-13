//
//  InfoView.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import UIKit
//import Then
import RxSwift
import RxCocoa
import Result
import RxGesture
import NSObject_Rx

class InfoView: UIView {
    
    // (语文，数学，英语)
    typealias AllScore = (String, String, String)
    
    var rowHeight = 40
    var buttonTapForString: Observable<[String]>!
    var buttonTapForDouble: Observable<[Double?]>!
    
    // MARK: - life cycle
    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

        self.addSubview()
        
        self.creatObservable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deinit")
    }
    
    // MARK: - getter and setter
    lazy var bgView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var subTitleOneLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var subTitleTwoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var subTitleThreeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var subTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.subTitleOneLabel, self.subTitleTwoLabel, self.subTitleThreeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var firstTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    lazy var secondTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    lazy var threeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.firstTextField, self.secondTextField, self.threeTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.orange
        return button
    }()
}

// MARK: - creatObservable
extension InfoView {
    func creatObservable() {
        buttonTapForString = button.rx.tap.map({ [unowned self] in
            let textFields = [self.firstTextField, self.secondTextField, self.threeTextField]
            return textFields.map({ return $0.text! })
        })
        .takeUntil(rx.deallocated)
        
        buttonTapForDouble = buttonTapForString
            .map({ $0.map({ return Double($0) }) })
        
//        self.rx.deallocated.subscribe({
//            print($0)
//        })
        
//        self.firstTextField.rx.text
//            .subscribe({
//            print($0)
//        })
//            .addDisposableTo(rx.disposeBag)
        
//        self.rx.tapGesture()
//            .subscribe({
//                print($0)
//            })
//            .disposed(by: rx.disposeBag)
    }
}


// MARK: - addSubview
extension InfoView {
    func addSubview() {
        self.addSubview(bgView)
        bgView.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(rowHeight * 5)
        })
        
        bgView.addSubview(topTitleLabel)
        topTitleLabel.snp.makeConstraints({
            $0.top.right.left.equalToSuperview()
            $0.height.equalTo(rowHeight)
        })
        
        bgView.addSubview(button)
        button.snp.makeConstraints({
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(rowHeight)
        })
        
        bgView.addSubview(subTitleStackView)
        subTitleStackView.snp.makeConstraints({
            $0.top.equalTo(topTitleLabel.snp.bottom)
            $0.left.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.bottom.equalTo(button.snp.top)
        })
        
        bgView.addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints({
            $0.right.equalToSuperview()
            $0.size.bottom.equalTo(subTitleStackView)
        })
        
    }
}
