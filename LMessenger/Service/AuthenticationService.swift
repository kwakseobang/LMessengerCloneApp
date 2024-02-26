//
//  AuthenticationService.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth
import GoogleSignIn
//인증 에러 타입
enum AuthenticationError: Error {
    case clientIDError
    case TokenError
    case invalidated
}
//인증 서비스에 대한 프로토콜을 만들고 구현체 만든다
protocol AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError>
}
//구현체
class AuthenticationService: AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError> {
        Empty().eraseToAnyPublisher()
    }
}
/// 구글 로그인은 Combine을 제공하지 않기 때문에  응답으로 CompletuonHandler를 구현하고 이걸로  Publisher를 만드는 작업 할 예정
extension AuthenticationService {
    // completion을 받을 수 있는 메소드
    //앱의 프레젠테이션 뷰 컨트롤러 및 클라이언트 ID를 Google 로그인 제공업체의 signIn 메서드에 전달한 후 반환되는 Google 인증 토큰으로부터 Firebase 인증 사용자 인증 정보를 만듭니다.
    private func signInWithGoogle(completion: @escaping ( Result<User,Error>) -> Void) {
        //firebase 클라이언트 id로 구글 컨피그레이션 옵젝을 생성 예정
        // 1. 클라이언트 id를 firebase App을 통해 가져온다.
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(AuthenticationError.clientIDError))  // clientID가 없을 경우 failure를 파라미터로 보낸다.
            return
        }
        //Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        //구글 로그인 창이 뜰 뷰를 가져와야되는데 윈도우에서 루트 뷰를 추출하여 그 뷰를 보내준다.
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] result, error in
            if let error {
                completion(.failure(error))
                return
            }
            //Login이 성공했을 때 id 토큰과, 접근 토큰으로 credential 생성해서 firebase 인증 진행
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                completion(.failure(AuthenticationError.TokenError))
                return
            }
            // credential 생성
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )
            // TODO: google login이 완료가 됐을 시
            self?.authenticateUserWithFirebase(credential: credential, completion: completion)
        }
    }
    // firebase 인증을 진행 할 함수
    private func authenticateUserWithFirebase(credential: AuthCredential, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
          // At this point, our user is signed in
            if let error {
                completion(.failure(error))
                return
            }
            //결과가 없을 경우
            guard let result else {
                completion(.failure(AuthenticationError.invalidated))
                return
            }
            
            let firebaseUser = result.user
            let user: User = .init(
                id: firebaseUser.uid,
                name: firebaseUser.displayName ?? "",
                phoneNumber: firebaseUser.phoneNumber,
                profileURL: firebaseUser.photoURL?.absoluteString
            )
            completion(.success(user))
        }
    }
}
//Preview용
class StubAuthenticationService: AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User,ServiceError> {
        Empty().eraseToAnyPublisher()
    }
}


