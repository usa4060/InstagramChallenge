import Foundation
import Alamofire

class CheckDuplicateLoginIdDataManager{
    func checkDuplicateLoginId(_ loginId : String, _ viewController : UIViewController, _ completion: @escaping () -> Void){
        var headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json",
        ]
        var param : Parameters = [
            "loginId" : "\(loginId)",
        ]
        AF.request("\(Constant.BASE_URL)/check-duplicate-login-id", method: .get , parameters: param ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: AutoSignInModel.self){response in
                switch response.result {
                case .success(let response):
                    print("성공")
                    switch response.code{
                    case 1000:
                        completion()
                    case 2103:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "계정 아이디를 입력해주세요")
                        print("계정 아이디를 입력해주세요")
                    case 2104:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "계정 아이디는 20자리 미만으로 입력해주세요.")
                        print("계정 아이디는 20자리 미만으로 입력해주세요.")
                    case 2230:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "중복된 아이디입니다.")
                        print("중복된 아이디입니다.")
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
