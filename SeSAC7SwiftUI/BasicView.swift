//
//  BasicView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/20/25.
//

/*
 기존 뷰에 modifier method를 통해 modifier가 적용된 새로운 뷰를 반환
 과도하게 체이닝할 경우, 뷰트리가 복잡해질 수 있어 뷰렌더링 계산 비용이 높아질 수 있음
 */

import SwiftUI

struct BasicView: View {
    var body: some View {
        VStack{
            ProfileView()
            ProfileView()
            ProfileView()
            Image(systemName: "star")
                .asYellowBackgroundCornerView()
            Text("Hello, World!")
                .padding()
                .border(.black, width: 3)
                .background(.yellow)
                .padding()
                .border(.red)
            Text("Hello, World!")
                .border(.black, width: 3)
                .background(.yellow)
                .padding()
                .background(.red)
        }
    }
}

#Preview {
    BasicView()
}
