//
//  ProvinceDetailView.swift
//  finalExamKunal
//
//  Created by Kunal Bajaj on 2024-12-06.
//

import SwiftUI

struct ProvinceDetailView: View {
    
    let province: Provinces
    var body: some View {
        VStack {
            Text("Province Detail View").font(.title)
            Spacer()
            Text("Name: \(province.name ?? "")")
            Text("Capital: \(province.capitalCity?.name ?? "")")
            Text("Population: \(String(province.population ?? 0))" )
            Text("Description: \(province.description ?? "") ")
        }
    }
}


