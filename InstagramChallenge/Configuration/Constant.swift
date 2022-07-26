
import Alamofire
import UIKit
//MARK: - Project 전체에서 공통으로 사용하는 값들

struct Constant {
    
    static let BASE_URL = "http://challenge-api.gridge.co.kr/app"
    static let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .default)
    static var USER_JWTTOKEN = ""
    static var USER_ID : Int = 0
    static var FEED_ID : Int = 0
    //MARK: - 가져온 피드 목록
    static var getFeeds : [GetFeedsResult] = []
    static var getContentsList : [GetContentsList] = []
    //MARK: - 가져온 특정 유저의 피드 목록
    static var userFeed : [UserFeedResult] = []
    static var userFeedContentsList : [UserFeedContentsList] = []
    //MARK: - 가저온 특정 피드의 댓글 목록
    static var getComments : [GetCommentsResult] = []
    //MARK: - 가져온 특정 유저와의 채팅
    static var getChat : [GetChatResult] = []
    
    
   
}
