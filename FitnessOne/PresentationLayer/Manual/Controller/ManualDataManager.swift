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
       
    var rows: [String] = ["ewrwe", "ewr6676we"]
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = rows[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withClass: ManualCell.self, forIndexPath: indexPath)
        cell.setupCell(title: row)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.row)
    }
}
