import Foundation
import Alamofire

// MARK: - GetCommentsModel
struct GetCommentsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [GetCommentsResult]
}


// MARK: - Result
struct GetCommentsResult: Codable {
    let id: Int
    let loginID, commentText, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case loginID = "loginId"
        case commentText, createdAt, updatedAt
    }
}
