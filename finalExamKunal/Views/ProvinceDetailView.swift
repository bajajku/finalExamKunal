//
//  ProvinceDetailView.swift
//  finalExamKunal
//
//  Created by Kunal Bajaj on 2024-12-06.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ProvinceDetailView: View {
    
    
    let province: Provinces
    var body: some View {
        let annotations = [City(name: province.capitalCity?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: province.capitalCity?.latitude ?? 0, longitude: province.capitalCity?.longitude ?? 0))]
        VStack {
            Text("Province Detail View").font(.title)
            Spacer()
            Text("Name: \(province.name ?? "")")
            Text("Capital: \(province.capitalCity?.name ?? "")")
            Text("Population: \(String(province.population ?? 0))" )
            Text("Description: \(province.description ?? "") ")
            
            
            Spacer()
            
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: province.capitalCity?.latitude ?? 0, longitude: province.capitalCity?.longitude ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            
            Map(coordinateRegion: .constant(region), annotationItems: annotations){
                MapPin(coordinate: $0.coordinate)
            }
                
            
            
            
        }
        .onAppear(
        )
    }
}


