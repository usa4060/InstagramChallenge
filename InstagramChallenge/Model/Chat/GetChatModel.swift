import Foundation
import Alamofire

// MARK: - GetChatModel
struct GetChatModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [GetChatResult]
}

// MARK: - Result
struct GetChatResult: Codable {
    let chatID, userID: Int
    let content, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case chatID = "chatId"
        case userID = "userId"
        case content, createdAt, updatedAt
    }
}
