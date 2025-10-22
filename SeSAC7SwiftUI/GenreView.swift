//
//  GenreView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/22/25.
//

import SwiftUI

// Spacer + Padding
// HStack(iOS 13+) vs LazyHStack(iOS 14+)
// .onAppear vs .onDisappear
// ForEach. Swift KeyPath

struct GenreModel: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let count: Int
}

struct GenreView: View {
    
    @State var typeArray = ["영화", "드라마", "뮤지컬", "애니메이션", "전시회"]
    let genreList = [
        GenreModel(image: "star", title: "로맨스", count: 11),
        GenreModel(image: "star.fill", title: "스릴러", count: 22),
        GenreModel(image: "heart", title: "SF", count: 33),
        GenreModel(image: "heart.fill", title: "범죄", count: 44)
    ]
    
    var body: some View {
        VStack {
            Button("카테고리 추가") {
                typeArray.insert("Jack", at: 0)
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(typeArray, id: \.self) { item in
                        TypeCell(title: item)
                    }
                }
                .padding()
            }
            ScrollView(.vertical) {
                VStack {
                    ForEach(genreList, id: \.id) { item in
                        GenreCell(image: item.image, title: item.title, count: item.count)
                    }
                }
            }
        }
    }
}

private struct TypeCell: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .frame(width: 100, height: 100)
                .background(.green)
                .cornerRadius(10)
        }
        .onAppear {
            print("TypeCell", title)
        }
    }
}

private struct GenreCell: View {
    let image: String
    let title: String
    let count: Int
    
    var body: some View {
        HStack {
            Image(systemName: image)
            VStack(alignment: .leading) {
                Text(title)
                Text("\(count)개")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.yellow)
    }
}

#Preview {
    GenreView()
}
