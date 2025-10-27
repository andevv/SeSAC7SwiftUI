//
//  CoinView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct Money: Identifiable {
    let id = UUID()
    let name: String
    let count: Int
    var like: Bool
}

struct CoinView: View {
    
    @State private var list: [Money] = [
        Money(name: "비트코인", count: 12313414, like: true),
        Money(name: "이더리움", count: 111, like: false),
        Money(name: "도지코인", count: 122, like: false)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                listView()
            }
            .navigationTitle("My Coin")
        }
        .onAppear {
            list = [
                Money(name: "비트코인", count: 123, like: true),
                Money(name: "이더리움", count: 111, like: false),
                Money(name: "도지코인", count: 122, like: false)
            ]
        } // .onAppear vs .task(iOS15+)
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach($list, id: \.id) { $item in
                CoinRowView(data: $item)
            }
        }
    }
}

#Preview {
    CoinView()
}
