//
//  InsetTextField.swift
//  FitnessOne
//
//  Created by Максим Локтев on 17/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal class InsetTextField: UITextField {
    
    var contentInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: contentInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: contentInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: contentInset)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }
}
