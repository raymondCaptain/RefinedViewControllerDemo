//
//  InfoView.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/28.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    // MARK: - life cycle
    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

        
        self.addSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.addSubview(bgView)
        bgView.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        })
        
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({
            $0.left.top.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalToSuperview().dividedBy(2)
        })
        
        bgView.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints({
            $0.right.top.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalToSuperview().dividedBy(2)
            
        })
        
        bgView.addSubview(showIndictorButton)
        showIndictorButton.snp.makeConstraints({
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2)
        })
    }
    
    // MARK: - getter and setter
    lazy var bgView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var showIndictorButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.orange
        return button
    }()
}
