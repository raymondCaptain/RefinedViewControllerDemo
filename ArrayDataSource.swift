//
//  ArrayDataSource.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import UIKit

class ArrayDataSource<Element, Cell: UITableViewCell>: NSObject, UITableViewDataSource where Cell: ConfigureCell, Cell.E == Element {
    
    typealias E = Element
    
    var items: [E]!
    var cellIdentifier = "default"

    override init() {
        super.init()
    }
    
    // MARK: - UITableViewDataSource
    // 泛型类延展里的方法不会暴露给OC，所以这些协议方法只能写在这里，而不能单独写在 extension 里
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? Cell
        let cell = aCell ?? Cell(style: .default, reuseIdentifier: cellIdentifier)
        
        cell.configure(for: item(atIndexPath: indexPath))
        return cell
    }

}

extension ArrayDataSource {
    func item(atIndexPath indexPath: IndexPath) -> E {
        return items[indexPath.row]
    }
}
