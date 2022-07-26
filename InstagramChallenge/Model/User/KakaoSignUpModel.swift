import Foundation
import Alamofire

// MARK: - KakaoSignUpModel
struct KakaoSignUpModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: KakaoSignUpResult
}

// MARK: - Result
struct KakaoSignUpResult: Codable {
    let jwt: String
}
