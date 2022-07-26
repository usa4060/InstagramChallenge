import Foundation
import Alamofire

// MARK: - SignUpModel
struct SignUpModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignUpResult
}
 
struct SignUpResult: Codable {
    let jwt: String
}
