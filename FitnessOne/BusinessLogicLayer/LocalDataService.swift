//
//  LocalDataService.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

protocol LocalDataService {
    func getManuals() -> [Manual]
}

class LocalDataServiceImpl: LocalDataService {
    
    func getManuals() -> [Manual] {
        
        if let path = Bundle.main.path(forResource: "manuals", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                let manualList = try decoder.decode(ManualList.self, from: data)
                    
                return manualList.manuals
            } catch {
                // error
            }
        }
        
        return []
    }
    
}
