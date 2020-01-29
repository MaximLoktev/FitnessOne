//
//  ProfileDataManager.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit


internal class ProfileDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    enum Item {
        case header(image: UIImage?)
        case specifications(title: String, description: String)
    }

    var items: [Item] = []
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]

        switch item {
        case .header(let image):
            let cell = tableView.dequeueReusableCell(withClass: ProfileHeaderCell.self, forIndexPath: indexPath)
            cell.setupCell(image: image)
            return cell
        case let .specifications(title, description):
            let cell = tableView.dequeueReusableCell(withClass: ProfileSpecificationCell.self, forIndexPath: indexPath)
            cell.setupCell(title: title, description: description)
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let item = items[indexPath.row]
        
        switch item {
        case .header:
            return UIScreen.main.bounds.width * 0.4
        case .specifications:
            return 44.0
        }
    }
}
