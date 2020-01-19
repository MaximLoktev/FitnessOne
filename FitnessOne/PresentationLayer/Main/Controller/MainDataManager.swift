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
    
    var onSelectNextScreen: ((ScreensMenu) -> Void)?
    
    private let widthCell: CGFloat = (UIScreen.main.bounds.width - 16.0) / 3.0
    
    var items: [Menu] = [Menu(name: "Вес", image: "weight", screen: .weight),
                         Menu(name: "Прогресс", image: "chart", screen: .progress),
                         Menu(name: "Еда", image: "cutlery", screen: .food),
                         Menu(name: "Бег", image: "stretching", screen: .run),
                         Menu(name: "Упражнения", image: "stretching", screen: .exercises),
                         Menu(name: "Справочник", image: "bulb", screen: .manual),
                         Menu(name: "Поддрежка", image: "alertQue", screen: .support),]
    
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
        
        let item = items[indexPath.item]
        onSelectNextScreen?(item.screen)
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: widthCell, height: widthCell)
    }
    
}

