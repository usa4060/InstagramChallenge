import Foundation
import Alamofire

// MARK: - AutoSignInModel
struct AutoSignInModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
