//
//  CommonExtension.swift
//  SimpleTodo
//
//  Created by 이재섭(Lee, JaeSeob) on 21/01/2020.
//  Copyright © 2020 leftydev. All rights reserved.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        let nameSpaceClassName = NSStringFromClass(self)
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return nameSpaceClassName
            
        }
        return className
    }
}

extension UIViewController {
    static var reuseIdentifier: String {
        let nameSpaceClassName = NSStringFromClass(self)
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return nameSpaceClassName
            
        }
        return className
    }
}
