import Foundation
import Alamofire

// MARK: - CheckDuplicateLoginIDModel
struct CheckDuplicateLoginIDModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
