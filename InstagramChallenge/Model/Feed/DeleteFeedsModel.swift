import Foundation
import Alamofire

// MARK: - DeleteFeedsModel
struct DeleteFeedsModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}
