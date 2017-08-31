//
//  ConfigureCellProcotol.swift
//  RefinedViewControllerDemo
//
//  Created by zhiweimiao on 2017/8/25.
//  Copyright © 2017年 zhiweimiao. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigureCell {
    
    associatedtype Element
    typealias E = Element
    
    func configure(for item: E)
}
