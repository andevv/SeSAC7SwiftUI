//
//  SearchView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isPresentedTamagochiView = false
    @State private var isPresentedBasiciView = false

    
    var body: some View {
        NavigationView {
            List {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .sheet(isPresented: $isPresentedTamagochiView, content: {
                TamagochiView()
            })
            .fullScreenCover(isPresented: $isPresentedBasiciView, content: {
                BasicView()
            })
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "유저를 검색해보세요")
            .navigationTitle("검색")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "star")
                        .buttonWrapper {
                            isPresentedTamagochiView = true
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Text("A")
                        .buttonWrapper {
                            isPresentedBasiciView = true
                        }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
