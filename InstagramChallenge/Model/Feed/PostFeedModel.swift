import Foundation
import Alamofire

// MARK: - PostFeedsModel
struct PostFeedsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

