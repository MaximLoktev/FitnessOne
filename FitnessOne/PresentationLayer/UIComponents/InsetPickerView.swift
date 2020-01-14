//
//  InsetPickerView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 07/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

class InsetPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    
    private let pickerArray: [Skill] = [.beginner, .lover, .profi]
    
    var skillLvl: Skill = .beginner
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        skillLvl = pickerArray[0]
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerArray.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let skill = pickerArray[row]
        skillLvl = skill
    }
}
