//
//  ProfileView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ProfileViewDelegate: class {

}

internal class ProfileView: UIView {

    // MARK: - Properties

    weak var delegate: ProfileViewDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellClass: ProfileHeaderCell.self)
        tableView.register(cellClass: ProfileSpecificationCell.self)
        tableView.allowsSelection = false
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        
        return tableView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(tableView)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
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
