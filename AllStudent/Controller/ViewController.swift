//
//  ViewController.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import UIKit

typealias VoidBlock = () -> Void

class ViewController: UIViewController {
    
    var store = Store()
    var dataSource = ArrayDataSource<Student, StudentCell>()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addSubviews()
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - configure
    func addSubviews() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }

    // MARK: - UITableViewDataSource
    func setupTableView() {
        dataSource.items = store.students
        self.tableView.dataSource = dataSource
    }
    
    
    // MARK: - getter and setter
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        return tableView
    }()

}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let student = store.item(at: indexPath)
        self.showInfoView(with: student)
    }
}

// MARK: - event response
extension ViewController {
    func showInfoView(with student: Student) {
        let infoView = InfoView(student: student)
        self.view.addSubview(infoView)
        infoView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
}
