//
//  GreetingCollectionView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

class GreetingCollectionView: UICollectionView {
    
    private let layout = UICollectionViewFlowLayout()
    
    init() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        bounces = false
        
        //alwaysBounceVertical = true
        
        register(cellClass: GreetingCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
