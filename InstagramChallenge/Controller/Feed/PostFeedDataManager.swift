import Foundation
import Alamofire

class PostFeedDataManager{
    func postFeed(_ feedText : String, _ contentsUrls : [String],  _ viewController : UIViewController, completion: @escaping () -> Void){
        var headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json",
                    "x-access-token" : Constant.USER_JWTTOKEN
        ]
        var param : Parameters = [
                "feedText" : "\(feedText)",
                "contentsUrls" : "\(contentsUrls)"
        ]
        
        AF.request("\(Constant.BASE_URL)/feed", method: .post, parameters: param ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: PostFeedModel.self){response in
                switch response.result {
                case .success(let response):
                    print("성공")
                    switch response.code{
                    case 1000:
                        completion()
                    case 2000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "JWT 토큰을 입력해주세요.")
                        print("JWT 토큰을 입력해주세요.")
                    case 2902:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "페이지피드 문구는 최소 1자부터 최대 1000자 이내로 입력해야합니다.")
                        print("페이지피드 문구는 최소 1자부터 최대 1000자 이내로 입력해야합니다.")
                    case 2903:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "페이지피드 컨텐츠는 최소 1장부터 최대 5장 이내로 선택해야합니다.")
                        print("페이지피드 컨텐츠는 최소 1장부터 최대 5장 이내로 선택해야합니다.")
                    case 3000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "자동로그인 검증에 실패하였습니다. 다시 시도해주세요.")
                        print("자동로그인 검증에 실패하였습니다. 다시 시도해주세요.")
                    case 3001:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "자동로그인이 만료되었습니다. 다시 로그인해주세요.")
                        print("자동로그인이 만료되었습니다. 다시 로그인해주세요.")
                    case 4000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "데이터 베이스 커넥션 에러")
                        print("데이터 베이스 커넥션 에러")
                    case 4001:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "서버 에러")
                        print("서버 에러")
                    case 4002:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "데이터 베이스 쿼리 에러")
                        print("데이터 베이스 쿼리 에러")
                    default:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "알 수 없는 에러가 발생하였습니다.")
                        print("알 수 없는 에러가 발생하였습니다. : 코드번호 \(response.code)")
                    }
                case .failure(let error):
                    print("회원가입 실패")
                    debugPrint(error)
                }

            }
        
    }
}
