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
        }
    }
}

#Preview {
    SearchDetailView(data: Person(name: "", age: 0))
}
