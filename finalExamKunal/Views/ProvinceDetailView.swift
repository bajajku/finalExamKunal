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
            Text(province.name ?? "")
            Text(province.capitalCity?.name ?? "")
            Text(String(province.population ?? 0) )
            Text(province.description ?? "")
        }
    }
}


