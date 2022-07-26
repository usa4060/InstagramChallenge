import Foundation
import Alamofire

// MARK: - PostFeedsModel
struct PostFeedModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

