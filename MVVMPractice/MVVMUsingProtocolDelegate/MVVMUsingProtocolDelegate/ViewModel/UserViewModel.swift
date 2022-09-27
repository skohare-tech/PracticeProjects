
import UIKit
protocol ViewModelProtocol: AnyObject{
    func dataPass()
}

class UserViewModel {
    
    var user1 : Users?
    weak var delegateP : ViewModelProtocol?
private let str = "https://jsonplaceholder.typicode.com/users"
    init(view : ViewModelProtocol)
    {
        self.delegateP = view
        config()
    }
    func config(){
        let service = Service()
       // service.delegate = self
       // service.delegate1 = self
       // service.apiData1(str: str)
        service.apiData3(apistring: str, resultType: Users.self, requestBody: nil, requestHttpMethod: "GET") { result in
            self.user1 = result
            self.delegateP?.dataPass()
        }
    }}
//1//
//extension UserViewModel :APIServiceProtocol{
//    func getData(users: Users) {
//        self.user1 = users
//        delegateP?.dataPass()
//    }
//}
extension UserViewModel: APIServiceProtocol1{
    func getData1(data: Data?) {
        updateData(data: data!)
        delegateP?.dataPass()
    }

    func updateData(data:Data){
        do {
            self.user1 = try JSONDecoder().decode(Users.self, from: data)
        } catch  {
            print(error.localizedDescription)
        }
    }
    

}
