//
//  Services.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import Foundation
//인증 서비스 틀
protocol ServiceType {
    
    var authService: AuthenticationServiceType { get set}
}

class Services: ServiceType { 
    var authService: AuthenticationServiceType
    
    init() {
        self.authService = AuthenticationService()
    }
    
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    
     
}
