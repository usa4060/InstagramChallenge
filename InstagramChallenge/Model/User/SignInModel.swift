import Foundation
import Alamofire

// MARK: - SignInModel
struct SignInModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignInResult
}

// MARK: - Result
struct SignInResult: Codable {
    let jwt: String
}
