import Foundation
import Alamofire

// MARK: - PostCommentsModel
struct PostCommentsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
