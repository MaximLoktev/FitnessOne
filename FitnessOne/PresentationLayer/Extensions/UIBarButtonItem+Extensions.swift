//
//  UIBarButtonItem+Extensions.swift
//  FitnessOne
//
//  Created by Максим Локтев on 05/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    static func backBarButton(target: Any?, action: Selector) -> UIBarButtonItem {
        let backButton: UIButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(target, action: action, for: UIControl.Event.touchUpInside)

        let backBarButton = UIBarButtonItem(customView: backButton)
        let currWidth = backBarButton.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = backBarButton.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        return backBarButton
    }
    
    static func editingBarButton(target: Any?, action: Selector) -> UIBarButtonItem {
        let backButton: UIButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "edit"), for: .normal)
        backButton.addTarget(target, action: action, for: UIControl.Event.touchUpInside)

        let backBarButton = UIBarButtonItem(customView: backButton)
        let currWidth = backBarButton.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = backBarButton.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        return backBarButton
    }
}
