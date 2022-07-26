import Foundation
import Alamofire

// MARK: - PostFeedModel
struct UserFeedModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [UserFeedResult]
}


// MARK: - Result
struct UserFeedResult: Codable {
    let feedID: Int
    let feedLoginID, feedText, feedCreatedAt, feedUpdatedAt: String
    let feedCommentCount: Int
    let contentsList: [UserFeedContentsList]

    enum CodingKeys: String, CodingKey {
        case feedID = "feedId"
        case feedLoginID = "feedLoginId"
        case feedText, feedCreatedAt, feedUpdatedAt, feedCommentCount, contentsList
    }
}


// MARK: - ContentsList
struct UserFeedContentsList: Codable {
    let contentsID: Int
    let contentsURL: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case contentsID = "contentsId"
        case contentsURL = "contentsUrl"
        case createdAt, updatedAt
    }
}
