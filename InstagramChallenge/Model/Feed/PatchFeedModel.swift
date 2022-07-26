import Foundation
import Alamofire

// MARK: - PatchFeedsModel
struct PatchFeedModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

