import Foundation
import Alamofire

class KakaoSignUpDataManager{
    func kakaoSignUp(_ accessToken : String, _ realName : String, _ birthDate : String , _ loginId : String , _ phoneNumber : String, _ viewController : UIViewController, completion: @escaping (_ data: KakaoSignUpResult) -> Void){
        let headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Accept": "application/json"
        ]
        let param : Parameters = [
                "accessToken" : "\(accessToken)",
                "realName" : "\(realName)",
                "birthDate" : "\(birthDate)",
                "loginId" : "\(loginId)",
                "phoneNumber" : "\(phoneNumber)"
        ]
        
        AF.request("\(Constant.BASE_URL)/kakao-sing-up", method: .post, parameters: param ,encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: KakaoSignUpModel.self){response in
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
                    case 2103:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "계정 아이디를 입력해주세요")
                        print("계정 아이디를 입력해주세요")
                    case 2104:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "계정 아이디는 20자리 미만으로 입력해주세요.")
                        print("계정 아이디는 20자리 미만으로 입력해주세요.")
                    case 2111:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "생일을 올바르게 입력 해주세요.")
                        print("생일을 올바르게 입력 해주세요.")
                    case 2113:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "번호를 11자리 미만으로 입력해주세요.")
                        print("번호를 11자리 미만으로 입력해주세요.")
                    case 2114:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "핸드폰 번호를 숫자만으로 입력해주세요.")
                        print("핸드폰 번호를 숫자만으로 입력해주세요.")
                    case 2115:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "아이디를 숫자와 영문으로만 입력해주세요.")
                        print("아이디를 숫자와 영문으로만 입력해주세요.")
                    case 2116:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "실명을 입력 해주세요.")
                        print("실명을 입력 해주세요.")
                    case 2236:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "카카오 토큰이 잘못 되었습니다.")
                        print("카카오 토큰이 잘못 되었습니다.")
                    case 2237:
                        viewController.dismissIndicator()
                        viewController.presentAlert(title: "이미 카카오 계정이 존재합니다.")
                        print("이미 카카오 계정이 존재합니다.")
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
