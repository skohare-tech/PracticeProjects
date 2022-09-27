//
//  Service.swift
//  MVVMUsingProtocolDelegate
//
//  Created by Admin on 18/01/22.
//

import UIKit

protocol APIServiceProtocol: AnyObject {
    func getData(users: Users)
}
protocol APIServiceProtocol1: AnyObject {
    func getData1(data: Data?)
}
class Service {
    init(){
      //apiData()
    }
    private var user = Users()
    weak var delegate : APIServiceProtocol?
    weak var delegate1 : APIServiceProtocol1?
    let apiStr = "https://jsonplaceholder.typicode.com/users"
//1
    func apiData(){
        guard let url = URL(string: apiStr) else{return}
        URLSession(configuration: .default).dataTask(with: url) {  data, response, error in
            guard let data = data else{
                return}
          do{
              let userData = try JSONDecoder().decode(Users.self, from: data)
            self.user = userData
              print(userData.count)
              self.delegate?.getData(users: self.user)
              
          }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
}
//2
    func apiData1(str:String){
        if let url = URL(string: str){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else{return}
                self.delegate1?.getData1(data: data)
            }.resume()
        }
    }
//3
    func apiData3<T:Decodable>(apistring:String,resultType:T.Type,requestBody:Data?,requestHttpMethod: String,completionHandler: @escaping(_ result: T)->()){
        guard let url = URL(string: apistring) else {return}
        var request = URLRequest(url: url)
        request.httpBody = requestBody
        request.httpMethod = requestHttpMethod
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                return
            }
            do {
                 let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(result)
            } catch  {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

