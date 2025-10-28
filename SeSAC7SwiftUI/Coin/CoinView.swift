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
        //        Money(name: "비트코인", count: 12313414, like: true),
        //        Money(name: "이더리움", count: 111, like: false),
        //        Money(name: "도지코인", count: 122, like: false)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                listView()
            }
            .navigationTitle("My Coin")
        }
        .task { //비동기(iOS15+)
            list = [
                Money(name: "비트코인", count: 123, like: true),
                Money(name: "이더리움", count: 111, like: false),
                Money(name: "도지코인", count: 122, like: false)
            ]
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach($list, id: \.id) { item in
                CoinRowView(data: item)
            }
        }
    }
    
    func listViewLet() -> some View {
        LazyVStack {
            ForEach(list, id: \.id) { item in
                CoinRowLetView(data: item)
            }
        }
    }
}

#Preview {
    CoinView()
}
