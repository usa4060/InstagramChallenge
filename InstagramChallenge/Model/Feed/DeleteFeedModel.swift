import Foundation
import Alamofire

// MARK: - DeleteFeedsModel
struct DeleteFeedModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
