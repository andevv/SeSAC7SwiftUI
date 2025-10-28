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
                bannerView()
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
    
    //zstack vs .overlay
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(.brown)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(2, anchor: .topTrailing)
                        .offset(x: -50, y: -50)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.callout)
                Text("123,456,789원")
                    .font(.title)
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .frame(height: 160)
        
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
