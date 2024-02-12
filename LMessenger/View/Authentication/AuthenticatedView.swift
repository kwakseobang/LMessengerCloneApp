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
        switch authViewModel.authenticationState {
        case .authenticated:
            MainTabView()
        case.unauthenticated:
            LoginIntroView()
        }
    }
}

#Preview {
    //Preview용 서비스를 따로 만들어서 주입 why? Preview는 네트워크나 파베 연동 필요 x
    AuthenticatedView(authViewModel: .init(container: .init(services: StubService())))
}
