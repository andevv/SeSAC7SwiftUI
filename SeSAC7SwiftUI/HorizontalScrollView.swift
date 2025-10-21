//
//  HorizontalScrollView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/21/25.
//

import SwiftUI

//Swift 5.9 Generic Parameter Pack

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { item in
                    Text("\(item)")
                }
            }
        }
    }
}

#Preview {
    HorizontalScrollView()
}
