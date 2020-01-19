//
//  ManualView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol ManualViewDelegate: class {
    
}

internal class ManualView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ManualViewDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellClass: ManualCell.self)
        
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(tableView)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions

    func setupDataManager(dataManager: UITableViewDataSource & UITableViewDelegate) {
        tableView.delegate = dataManager
        tableView.dataSource = dataManager
        tableView.reloadData()
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
