//
//  SearchDetailView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct SearchDetailView: View {
    
    let data: Person
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.fill")
            HStack {
                Text(data.name)
                Text("(\(data.age)세)")
            }
            NavigationLink("다음 화면 전환하기") {
                SearchDetailDetailView()
            }
        }
    }
    
    init(data: Person) {
        self.data = data
        print("SearchDetailView Init \(data.name)")
    }
}

private struct SearchDetailDetailView: View {
    var body: some View {
        Text("완전 상세 화면")
    }
    
    init() {
        print("SearchDetailDetailView Init")
    }
}

#Preview {
    SearchDetailView(data: Person(name: "", age: 0))
}
