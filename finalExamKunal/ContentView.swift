//
//  ContentView.swift
//  finalExamKunal
//
//  Created by Kunal Bajaj on 2024-12-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ProvinceViewModel()
    var body: some View {
        VStack {
            
            Text("Web Services Example ").font(.title)
            NavigationStack{
                List(vm.provinceData?.provinces ?? [] , id: \.self){ province in
                    NavigationLink(destination: ProvinceDetailView(province: province)){
                        Text(province.name ?? "")
                    }
                }
            }
        }.onAppear{
            vm.getProvinceData()
        }
        }
}


#Preview {
    ContentView()
}
