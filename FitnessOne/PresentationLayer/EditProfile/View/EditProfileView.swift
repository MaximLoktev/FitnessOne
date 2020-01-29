//
//  EditProfileView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 26/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol EditProfileViewDelegate: class {

}

internal class EditProfileView: UIView {

    // MARK: - Properties

    weak var delegate: EditProfileViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
