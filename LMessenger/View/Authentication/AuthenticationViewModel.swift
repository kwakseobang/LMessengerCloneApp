//
//  AuthenticationViewModel.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import Foundation

enum AuthenticationState {
    case unauthenticated //비인증
    case authenticated //인증
}
class AuthenticationViewModel: ObservableObject {
    //이 값은 인증 뷰에서 로그인 여부를 확인하여 브랜치해주기때문에 Published 선언
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    // 서비스를 접근할 수 있도록 연결 작업
    private var container: DIContainer
    ///DIContainer를 통해서 서비스에 접근할 예정이므로 init()에 container를 받아서 뷰  모델이 넣어준다.
    init(container: DIContainer) {
        self.container = container
    }
}
