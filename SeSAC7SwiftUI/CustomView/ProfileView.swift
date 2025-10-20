//
//  ProfileView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/20/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Text("Jack")
                .asYellowBackgroundCornerView(40)
            Text("Finn")
                .asYellowBackgroundCornerView()
            Text("Den")
                .asYellowBackgroundCornerView(20)
        }
    }
}

#Preview {
    ProfileView()
}
