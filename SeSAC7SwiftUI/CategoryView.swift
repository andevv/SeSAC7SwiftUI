//
//  CategoryView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/21/25.
//

import SwiftUI
/*
 - 클릭 이벤트의 범위
 - titleKey, action
 - action, label
 */

struct CategoryView: View {
    var body: some View {
        HStack {
            category
                .buttonWrapper {
                    print("첫 번째 카테고리입니다.")
                }
            AsyncImage(url: URL(string: "https://picsum.photos/200"))
                .buttonWrapper {
                    print("두 번째 카테고리입니다.")
                    category
                        .buttonWrapper {
                            print("세 번째 카테고리입니다.")
                        }
                }
        }
    }
    var category: some View {
        HStack {
            Image(systemName: "star")
            Text("국내주식")
        }
        .padding()
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CategoryView()
}
