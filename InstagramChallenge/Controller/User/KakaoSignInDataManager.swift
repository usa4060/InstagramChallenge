import Foundation
import Alamofire

class KakaoSignInDataManager{
    func kakaoSignIn(_ accessToken : String, _ viewController : UIViewController, completion: @escaping (_ data: KakaoSignInResult) -> Void){
        var headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json"
        ]
        var param : Parameters = [
                "accessToken" : "\(accessToken)",
        ]
        
        AF.request("\(Constant.BASE_URL)/kakao-sing-in", method: .post, parameters: param ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: KakaoSignInModel.self){response in
                switch response.result {
                case .success(let response):
                    print("성공")
                    switch response.code{
                    case 1000:
                        completion(response.result)
                    case 2100:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "카카오 계정이 존재하지 않습니다.")
                        print("카카오 계정이 존재하지 않습니다.")
                    case 2236:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "카카오 토큰이 잘못 되었습니다.")
                        print("카카오 토큰이 잘못 되었습니다.")
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
