//
//  ProvinceDetailView.swift
//  finalExamKunal
//
//  Created by Kunal Bajaj on 2024-12-06.
//

import SwiftUI
import MapKit

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
            
            Spacer()
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: province.capitalCity?.latitude ?? 0, longitude: province.capitalCity?.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))))
        }
    }
}


