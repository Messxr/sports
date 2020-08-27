//
//  DataManager.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import Foundation

struct DataManager {
    
    func getData(forName name: String) -> [[String]]? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Data.self, from: jsonData)
                return decodedData.array
            }
        } catch {
            print(error)
            
        }
        return nil
    }
    
}
