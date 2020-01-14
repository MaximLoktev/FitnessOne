//
//  UIResponder+Extensions.swift
//  FitnessOne
//
//  Created by Максим Локтев on 13/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

extension UIResponder {
    
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
