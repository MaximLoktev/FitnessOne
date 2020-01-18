//
//  MainView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol MainViewDelegate: class {
    
}

internal class MainView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MainViewDelegate?
    
    private let collectionView = MainCollectionView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(collectionView)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions

    func setupDataManager(dataManager: UICollectionViewDataSource & UICollectionViewDelegate) {
        collectionView.delegate = dataManager
        collectionView.dataSource = dataManager
        collectionView.reloadData()
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

