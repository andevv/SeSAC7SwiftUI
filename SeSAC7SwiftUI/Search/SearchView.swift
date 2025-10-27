//
//  SearchView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isPresentedTamagochiView = false
    @State private var isPresentedBasiciView = false
    
    let list = [
        Person(name: "잭", age: 3),
        Person(name: "잭잭", age: 4),
        Person(name: "잭잭잭", age: 5),
        Person(name: "잭잭잭잭", age: 6),
        Person(name: "잭잭잭잭잭", age: 7),
        Person(name: "잭잭잭잭잭잭", age: 8),
        Person(name: "잭잭잭잭잭잭잭", age: 9)
    ]
    
    var filterList: [Person] {
        return searchText.isEmpty ? list : list.filter { $0.name.contains(searchText) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterList, id: \.id) { item in
                    setupRows(item)
                }
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
    
    func setupRows(_ item: Person) -> some View {
        HStack {
            Image(systemName: "person.fill")
            Text(item.name)
                .bold()
            Text("\(item.age)")
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SearchView()
}
