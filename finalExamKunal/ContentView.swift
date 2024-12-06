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
            Button("Get data"){
                vm.getProvinceData()
            }
            NavigationStack{
                List(vm.provinceData?.provinces ?? [] , id: \.self){ province in
                    NavigationLink(destination: EmptyView()){
                        Text(province.name ?? "")
                    }
                }
            }
        }
        }
}


#Preview {
    ContentView()
}
