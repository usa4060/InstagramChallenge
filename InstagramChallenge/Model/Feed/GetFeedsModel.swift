import Foundation
import Alamofire

// MARK: - GetFeedsModel
struct GetFeedsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [GetFeedsResult]
}

// MARK: - Result
struct GetFeedsResult: Codable {
    let feedID: Int
    let feedLoginID, feedText, feedCreatedAt, feedUpdatedAt: String
    let feedCommentCount: Int
    let contentsList: [GetContentsList]

    enum CodingKeys: String, CodingKey {
        case feedID = "feedId"
        case feedLoginID = "feedLoginId"
        case feedText, feedCreatedAt, feedUpdatedAt, feedCommentCount, contentsList
    }
}


// MARK: - ContentsList
struct GetContentsList: Codable {
    let contentsID: Int
    let contentsURL: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case contentsID = "contentsId"
        case contentsURL = "contentsUrl"
        case createdAt, updatedAt
    }
}
