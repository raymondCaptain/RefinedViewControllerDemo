//
//  AllStudentController.swift
//  RefinedAllStudentControllerDemo
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

class AllStudentController: UIViewController {
    
    var store = Store()
    var tableViewDataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Student>>()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addSubviews()
        self.setupTableView()
        
        self.eventResponse()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print(self, " is deinit")
    }
    
    // MARK: - configure
    func addSubviews() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        self.view.addSubview(testButton)
        testButton.snp.makeConstraints({
            $0.width.height.equalTo(100)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        })
    }
    
    func eventResponse() {
        testButton.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: rx.disposeBag)
    }
    
    
    // MARK: - getter and setter
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var testButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.gray
        return button
    }()
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension AllStudentController {
    func setupTableView() {
        self.setupTableViewDataSource()
        self.setupTalbeViewDelegate()
    }
    
    func setupTableViewDataSource() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
        tableViewDataSource.configureCell = { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)
            cell.textLabel?.text = String(item.average)
            return cell
        }
        
        store.studentsVar.asObservable()
            .map({ [SectionModel.init(model: "a", items: $0)] })
            .bind(to: tableView.rx.items(dataSource: tableViewDataSource))
            .addDisposableTo(rx.disposeBag)
    }
    
    func setupTalbeViewDelegate() {
        tableView.rx.itemSelected
            .do(onNext: { [unowned self] in
                // 考虑循环应用问题
                self.tableView.deselectRow(at: $0, animated: true)
            })
            .map({ [unowned self] in self.store.item(at: $0) })
            .subscribe(onNext: { [unowned self] student in
                self.showInfoView(with: student)
            })
            .addDisposableTo(rx.disposeBag)
    }
}

// MARK: - event response
extension AllStudentController {
    func showInfoView(with student: Student) {
        let infoView = InfoView(student: student)
        
        self.subscribe(infoView, withParameter: student)
        
        print(infoView)
        self.view.addSubview(infoView)
        infoView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
}


// MARK: - rxSubscribe
extension AllStudentController {
    func subscribe(_ infoView: InfoView, withParameter student: Student) {
                infoView.buttonTapForDouble
                    .map({ Result($0 as? [Double], failWith: .inputError) })
                    .flatMapResultLatest({ NetworkAPI().changeScore(forStudent: student.studentId, allScore: $0) })
                    .flatMapResultLatest({ self.store.refreshSingle.mapResultError { .refreshDataFail($0) } })
                    .subscribeReuslt(onSuccess: { [unowned infoView] in
                        print("刷新成功")
                        infoView.removeFromSuperview()
                    }, onFailure: {
                        switch $0 {
                        case .inputError:
                            print("输入有误")
                        case .changeScoreFail:
                            print("后台返回失败")
                        case .refreshDataFail:
                            print("刷新失败")
                        }
                    })
                    .addDisposableTo(rx.disposeBag)
        
//        infoView.buttonTapForDouble
//            .map({ Result($0 as? [Double], failWith: ChangeScoreError.inputError) })
//            .resolveResultError({ _ in print("输入有误") })
//            .flatMapLatest({ NetworkAPI().changeScore(forStudent: student.studentId, allScore: $0) })
//            .resolveResultError({ _ in print("后台返回失败") })
//            .flatMapLatest({ self.store.refreshSingle })
//            .resolveResultError({ _ in print("刷新失败") })
//            .subscribe(onNext: { [unowned infoView] in
//                print("刷新成功")
//                infoView.removeFromSuperview()
//            })
//            .addDisposableTo(rx.disposeBag)
    }
}

