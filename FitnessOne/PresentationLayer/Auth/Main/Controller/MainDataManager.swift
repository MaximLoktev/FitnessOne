//
//  MainDataManager.swift
//  FitnessOne
//
//  Created by Максим Локтев on 18/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal class MainDataManeger: NSObject, UICollectionViewDataSource,
    UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    private let widthCell: CGFloat = (UIScreen.main.bounds.width - 16.0) / 3.0
    
    var items: [Menu] = [
        Menu(name: "Вес", image: "weight"),
        Menu(name: "Прогресс", image: "chart"),
        Menu(name: "Еда", image: "cutlery"),
        Menu(name: "Бег", image: "athletics"),
        Menu(name: "Упражнения", image: "stretching"),
        Menu(name: "Справочник", image: "bulb"),
        Menu(name: "Поддрежка", image: "alertQue")
    ]
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withClass: MainCell.self, forIndexPath: indexPath)
        cell.setupCell(item: item)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: widthCell, height: widthCell)
    }
    
}

