//
//  ManualDataManager.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal class ManualDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    var onSelectManual: ((Manual) -> Void)?
    
    var items: [Manual] = []
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withClass: ManualCell.self, forIndexPath: indexPath)
        cell.setupCell(title: item.title)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        onSelectManual?(item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
