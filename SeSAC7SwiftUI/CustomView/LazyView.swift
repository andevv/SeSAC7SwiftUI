//
//  LazyView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/27/25.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    private let content: () -> Content
    
    var body: some View {
        content()
    }
    
    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
}

struct Test2View: View {
    var body: some View {
        LazyView(ProfileView())
    }
}
