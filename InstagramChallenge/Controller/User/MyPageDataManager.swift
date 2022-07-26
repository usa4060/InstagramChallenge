import Foundation
import Alamofire

class MyPageDataManager{
    func myPage(_ loginId : String, _ viewController : UIViewController, _ completion: @escaping (_ data : MyPageResult) -> Void){
        var headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json",
                    "x-access-token" : Constant.USER_JWTTOKEN
        ]
        AF.request("\(Constant.BASE_URL)/users/\(Constant.USER_ID)/my-page", method: .get ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: MyPageModel.self){response in
                switch response.result {
                case .success(let response):
                    print("성공")
                    switch response.code{
                    case 1000:
                        completion(response.result)
                    case 2000:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "JWT 토큰을 입력해주세요.")
                        print("JWT 토큰을 입력해주세요.")
                    case 2222:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "userId를 입력해주세요.")
                        print("userId를 입력해주세요.")
                    case 2223:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "해당 회원이 존재하지 않습니다.")
                        print("해당 회원이 존재하지 않습니다.")
                    case 2232:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "아이디가 잘못 되었습니다.")
                        print("아이디가 잘못 되었습니다.")
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
                        viewController.presentAlert(title: "데이터베이스 연결에 실패하였습니다")
                        print("데이터베이스 연결에 실패하였습니다")
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
                    print("로그인 실패")
                    print(error.localizedDescription)
                }

            }
        
    }
}
