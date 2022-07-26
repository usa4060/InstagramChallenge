import Foundation
import Alamofire

// MARK: - KakaoSignInModel
struct KakaoSignInModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: KakaoSignInResult
}

// MARK: - Result
struct KakaoSignInResult: Codable {
    let jwt: String
}
