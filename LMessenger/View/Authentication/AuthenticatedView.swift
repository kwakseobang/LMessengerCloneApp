//
//  AuthenticatedView.swift
//  LMessenger
//
//  Created by 곽서방 on 2/10/24.
//

import SwiftUI

// 사용자가 로그인 인증을 진행했는지 여부에 따라 로그인 뷰를 보여줄지 메인 탭 뷰를 보여줄지 결정
struct AuthenticatedView: View {
    @StateObject var authViewModel: AuthenticationViewModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init())
}
