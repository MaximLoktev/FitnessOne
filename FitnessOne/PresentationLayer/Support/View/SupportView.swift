//
//  SupportView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 23/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol SupportViewDelegate: class {

}

internal class SupportView: UIView {

    // MARK: - Properties

    weak var delegate: SupportViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
