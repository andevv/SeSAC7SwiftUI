//
//  YellowBackgroundCornerView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/20/25.
//

import SwiftUI

private struct YellowBackgroundCornerView: ViewModifier {
    
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .padding()
            .background(.yellow)
            .cornerRadius(cornerRadius)
    }
}

extension View {
    
    func asYellowBackgroundCornerView(_ cornerRadius: CGFloat = 10) -> some View {
        modifier(YellowBackgroundCornerView(cornerRadius: cornerRadius))
    }
    
}
