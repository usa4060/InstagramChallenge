import Foundation
import Alamofire

class AutoSignInDataManager{
    
    func autoSignIn(_ viewController : UIViewController, _ completion: @escaping () -> Void){
        let headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json",
                    "x-access-token" : Constant.USER_JWTTOKEN
        ]
        AF.request("\(Constant.BASE_URL)/auto-sign-in", method: .get ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: AutoSignInModel.self){response in
                switch response.result {
                case .success(let response):
                    print("성공")
                    switch response.code{
                    case 2000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "JWT 토큰을 입력해주세요.")
                        print("JWT 토큰을 입력해주세요.")
                    case 2001:
                        completion()
                    case 3000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "자동로그인 검증에 실패하였습니다. 다시 시도해주세요.")
                        print("자동로그인 검증에 실패하였습니다. 다시 시도해주세요.")
                    case 3001:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "자동로그인이 만료되었습니다. 다시 로그인해주세요.")
                        print("자동로그인이 만료되었습니다. 다시 로그인해주세요.")
                    default:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "알 수 없는 에러가 발생하였습니다.")
                        print("알 수 없는 에러가 발생하였습니다. : 코드번호 \(response.code)")
                    }
                case .failure(let error):
                    print("로그인 실패")
                    print(error.localizedDescription)
                }

            }
        
    }
}
