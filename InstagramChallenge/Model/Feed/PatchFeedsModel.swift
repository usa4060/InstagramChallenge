import Foundation
import Alamofire

// MARK: - PatchFeedsModel
struct PatchFeedsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

