//
//  GreetingDataManager.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal class GreetingDataManager: NSObject, UICollectionViewDataSource,
    UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var items: [Greeting] = [
        Greeting(title: "Иметь крепкое здоровье", image: "PersOne", description: "Следить за своим здоровьем, очень важно! Так может быть нам...", buttonTitle: "Далее"),
        Greeting(title: "Быть сильным", image: "PersTwo", description: "Заниматься по 30 мин спортом каждый день чтобы быть в хорошей физической форме", buttonTitle: "Далее"),
        Greeting(title: "Иметь красивое тело", image: "PersThree", description: "Плохая форма тела, плохой сон, недостаток силы, прибавка в весе, слабые кости, легко травмированные тело, депрессия, стресс, плохой обмен веществ, слабый иммунитет", buttonTitle: "Начать")
    ]
    
    private var currentPage: Int = 0
    
    var onPageSelected: ((Int, String) -> Void)?
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withClass: GreetingCell.self, forIndexPath: indexPath)
        cell.setupCell(item: item)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print(indexPath.item)
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return UIScreen.main.bounds.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.currentPage = currentPage
        let item = items[currentPage]
        onPageSelected?(currentPage, item.buttonTitle)
    }
    
    func setupNewPage() -> (index: Int, isLast: Bool) {
        let isLastPage: Bool = self.currentPage < items.count - 1
        if isLastPage {
            self.currentPage += 1
            let item = items[currentPage]
            onPageSelected?(currentPage, item.buttonTitle)
        }
        
        return (index: currentPage, isLast: !isLastPage)
    }
}
