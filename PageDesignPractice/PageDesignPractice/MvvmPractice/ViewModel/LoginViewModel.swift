//
//  LoginViewModel.swift
//  PageDesignPractice
//
//  Created by Admin on 18/01/22.
//

import Foundation
protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

class LoginViewModel
{
    var delegate : LoginViewModelDelegate?
    func loginUser(loginRequest: LoginRequest)
    {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        if(validationResult.success)
        {
            self.loginUser(loginRequest: loginRequest) { (loginApiResponse) in
                //return the response we get from loginResource
                DispatchQueue.main.async {
                    self.delegate?.didReceiveLoginResponse(loginResponse: loginApiResponse)
                }
            }
        } else
        {
            print(validationResult.error ?? "Validation error")
            return
        }
        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(id: "00", code: 400, message: "Error response", data: nil))
    }
    
    
    
    func loginUser(loginRequest: LoginRequest, completion : @escaping (_ result: LoginResponse?) -> Void)
    {
        
        print("API URL: \(ApiEndpoints.login)")
        let loginUrl = URL(string: ApiEndpoints.login)!
//        let httpUtility = HttpUtility()
        do {

            let loginPostBody = try JSONEncoder().encode(loginRequest)
            HttpUtility.shared.postApiData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self) { (loginApiResponse) in
           //     print(loginApiResponse.message)
                _ = completion(loginApiResponse)
            }
        }
        catch let error {
            
            print("API error:")
            debugPrint(error)
        }
    }
    
}
