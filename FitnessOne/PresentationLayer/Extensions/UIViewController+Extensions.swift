//
//  UIViewController+Extensions.swift
//  FitnessOne
//
//  Created by Максим Локтев on 13/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    var leafViewController: UIViewController {
        if let vc = (self as? UINavigationController)?.topViewController {
            return vc.leafViewController
        }
        if let vc = (self as? UITabBarController)?.selectedViewController {
            return vc.leafViewController
        }
        if let vc = presentedViewController {
            return vc.leafViewController
        }
        return self
    }
}
