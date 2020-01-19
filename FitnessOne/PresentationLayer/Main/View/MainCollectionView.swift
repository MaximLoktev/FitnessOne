//
//  MainCollectionView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 18/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

class MainCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = .zero
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        
        contentInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = true
        
        register(cellClass: MainCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
