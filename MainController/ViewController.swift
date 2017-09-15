//
//  ViewController.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import UIKit
import NSObject_Rx
import RxSwift
import RxCocoa
import RxOptional
import RxDataSources
import Result

typealias VoidBlock = () -> Void

class ViewController: UIViewController {
    
    let count = 0
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(RxSwift.Resources.total)

        self.addSubviews()
        
        self.eventResponse()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        delay(2) {
            print(RxSwift.Resources.total)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - configure
    func addSubviews() {
        self.view.addSubview(testButton)
        testButton.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    func eventResponse() {
        
        testButton.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.present(AllStudentController(), animated: true, completion: nil)
            })
            .disposed(by: rx.disposeBag)
        
    }
    
    
    // MARK: - getter and setter
    lazy var testButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.gray
        return button
    }()

}

