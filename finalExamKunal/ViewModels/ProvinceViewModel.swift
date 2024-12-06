//
//  MyViewModel.swift
//  finalExamKunal
//
//  Created by Kunal Bajaj on 2024-12-06.
//
// Kunal, 991648986

import Foundation
import SwiftUI

class ProvinceViewModel : ObservableObject {
    
    @Published var provinceData: ProvinceData?
    
    @Published var showError = false
    
    let baseUrl = "https://mohameom.dev.fast.sheridanc.on.ca/demo/provinces.json"
    
    func getProvinceData() {
                
        let url = URL(string: baseUrl)
        
        let task = URLSession.shared.dataTask(with: url!){ data, response, error in
            
            guard error  == nil  else{
                
                print("error \(error)")
                return
            }
            
            guard let data = data else {
                print(" error data not found")
                return
            }
            
            do {
                
                let items = try JSONDecoder().decode(ProvinceData.self, from: data)
                print(items)
                DispatchQueue.main.async {
                    self.provinceData = items
                }
                
            }catch {
                
                print("error \(error)")
            }
            
        }
        
        task.resume()
    }
    
}
