//
//  GreetingView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol GreetingViewDelegate: class {
    func viewDidTapNextButton(_ view: GreetingView)
}

internal class GreetingView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: GreetingViewDelegate?
    
    private let collectionView = GreetingCollectionView()
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 3
        page.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.4)
        page.currentPageIndicatorTintColor = .white
        page.isUserInteractionEnabled = false
        page.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        return page
    }()
    
    private let backgroundCollectionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundCollectionImage")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1), for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(backgroundCollectionImage)
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupDataManager(dataManager: UICollectionViewDataSource & UICollectionViewDelegate) {
        collectionView.delegate = dataManager
        collectionView.dataSource = dataManager
        collectionView.reloadData()
    }
    
    func setupPage(with page: Int, title: String) {
        pageControl.currentPage = page
        nextButton.setTitle(title, for: .normal)
    }
    
    func setupNewPage(page: Int) {
        collectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .right, animated: true)
    }
    
    // MARK: - Actions
    
    @objc
    func nextButtonAction(_ sender: UIButton) {
        delegate?.viewDidTapNextButton(self)
    }

    // MARK: - Layout
    
    private func makeConstraints() {
        backgroundCollectionImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-90.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.bottom.equalTo(collectionView.snp.bottom).offset(-30.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
    }
}
