//
//  CoinRowView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct CoinRowView: View {
    
    @Binding var data: Money
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.name)
                    .fontWeight(.bold)
                Text(data.count.formatted())
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("BTC-KRW")
            Image(systemName: data.like ? "star.fill" : "star")
                .buttonWrapper {
                    data.like.toggle()
                }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 20)
    }
}

struct CoinRowLetView: View {
    
    let data: Money
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.name)
                    .fontWeight(.bold)
                Text(data.count.formatted())
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("BTC-KRW")
            Image(systemName: data.like ? "star.fill" : "star")
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CoinRowView(data: .constant(Money(name: "tset", count: 123, like: false)))
}
