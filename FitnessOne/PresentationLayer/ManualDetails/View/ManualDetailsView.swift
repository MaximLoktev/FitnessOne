//
//  ManualDetailsView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ManualDetailsViewDelegate: class {

}

internal class ManualDetailsView: UIView {

    // MARK: - Properties

    weak var delegate: ManualDetailsViewDelegate?
    
    private let manualImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()
    
    let manualDetailsLabelH: UILabel = {
        let label = UILabel()
        //label.font = .systemFont(ofSize: 18.0)
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.2803796956, green: 0.2803796956, blue: 0.2803796956, alpha: 1)

        return label
    }()
    
    let manualDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.2803796956, green: 0.2803796956, blue: 0.2803796956, alpha: 1)

        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        addSubview(manualImage)
        addSubview(scrollView)
        scrollView.addSubview(manualDetailsLabelH)
        scrollView.addSubview(manualDetailsLabel)
        
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupLoad(item: Manual) {
        manualDetailsLabel.text = item.description
        manualImage.image = UIImage(named: item.image)
        manualDetailsLabelH.text = item.title
    }
    
    // MARK: - Actions
    
    // MARK: - Layout
    
    private func makeConstraints() {
        manualImage.snp.makeConstraints { make in
            make.height.equalTo(230.0)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(manualImage.snp.bottom).offset(5.0)
            make.left.right.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().offset(-16.0)
        }
        manualDetailsLabelH.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).inset(16.0)
            make.top.left.equalToSuperview()
        }
        manualDetailsLabel.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).inset(16.0)
            make.top.equalTo(manualDetailsLabelH.snp.bottom).offset(20.0)
            make.left.bottom.equalToSuperview()
        }
    }
}
