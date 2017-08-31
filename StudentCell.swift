//
//  StudentCell.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class StudentCell: UITableViewCell {
    
    // MARK: - life cycle
    override required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    func addSubviews() {
        self.addSubview(averageLabel)
        averageLabel.snp.makeConstraints({
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(30)
        })
    }
    
    // MARK: - getter and setter
    lazy var averageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
