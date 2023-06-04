//
//  BaseInteractor.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 29/5/2023.
//

import Foundation

protocol Cancellable {
    func cancel()
}

extension URLSessionTask: Cancellable {}

class BaseInteractor {
    
    private let endpoint = "https://reqres.in/api/users"
    
    func getUserListFromWS(page: Int, completion: @escaping( UserListRS?, Error? )->()) {
        
        guard let url = URL(string: endpoint + "?page=\(page)") else {
            let error: Error? = NSError(domain: "domain URL", code: 405, userInfo: [NSLocalizedDescriptionKey: "An error occurred reason: invalid URL"])
            completion(nil,error)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error {
                completion(nil,error)
                return
            }
            guard let data else {
                completion(nil,error)
                return
            }
            do {
                let objects = try JSONDecoder().decode(UserListRS.self, from: data)
                completion(objects,nil)
            } catch {
                completion(nil,error)
            }
        }.resume()
    }
}
