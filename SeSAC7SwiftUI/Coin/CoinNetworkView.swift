//
//  CoinNetworkView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/29/25.
//

import SwiftUI

struct CoinNetworkView: View {
    
    @State private var list: [Market] = [
        Market(market: "a", koreanName: "a", englishName: "a")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                listView()
            }
            .navigationTitle("My Coin")
        }
        .onAppear {
            Task { }
        }
        .onDisappear { }
        .task {
            do {
                let result = try await Network.fetchAllMarket()
                list = result
            } catch APIError.invalidResponse {
                list = []
            } catch {
                print("알 수 없는 에러")
            }
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(list, id: \.id) { item in
                CoinNetworkRow(data: item)
            }
        }
    }
}

struct CoinNetworkRow: View {
    
    let data: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.koreanName)
                    .fontWeight(.bold)
                Text(data.englishName)
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(data.market)
            Image(systemName: data.like ? "star.fill" : "star")
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 20)
    }
}

// 실제 네트워크 통신이 preview에서도 발생
// @Previewable, PreviewModifier

#Preview {
    CoinNetworkView()
}
