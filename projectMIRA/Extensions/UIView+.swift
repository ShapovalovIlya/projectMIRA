//
//  UIView+.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 22.08.2022.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
}
