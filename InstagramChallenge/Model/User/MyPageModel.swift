import Foundation
import Alamofire

// MARK: - MyPageModel
struct MyPageModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MyPageResult
}

// MARK: - Result
struct MyPageResult: Codable {
    let loginID, realName: String
    let followerCount, followingCount, feedCount: Int

    enum CodingKeys: String, CodingKey {
        case loginID = "loginId"
        case realName, followerCount, followingCount, feedCount
    }
}
