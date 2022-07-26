import Foundation
import Alamofire

// MARK: - PostChatModel
struct PostChatModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PostChatResult
}

// MARK: - Result
struct PostChatResult: Codable {
    let userID: Int
    let content: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case content
    }
}
