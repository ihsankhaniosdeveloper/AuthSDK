//
//  AuthManager.swift
//  AuthSDK
//
//  Created by Ahmed Durrani on 27/06/2024.
//

import Foundation
public class AuthManager {
    public static let shared = AuthManager()
    
    private init() {}
    
    public func login(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void){
        let request = LoginRequest(email: email, password: password)
        guard let url = URL(string: "https://yourapi.com/login") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500, userInfo: nil)))
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(loginResponse.user))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
     
        
    }
    
    
    public func signup(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        let request = SignupRequest(email: email, password: password)
        guard let url = URL(string: "https://yourapi.com/signup") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
            
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500, userInfo: nil)))
                return
            }
            
            do {
                let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: data)
                completion(.success(signUpResponse.user))
            } catch {
                completion(.failure(error))
            }
        }
        task.response
    }
}
