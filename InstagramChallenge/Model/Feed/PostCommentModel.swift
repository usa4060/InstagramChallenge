import Foundation
import Alamofire

// MARK: - PostCommentsModel
struct PostCommentModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
