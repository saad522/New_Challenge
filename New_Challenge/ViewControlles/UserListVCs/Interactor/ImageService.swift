//
//  ImageService.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 30/5/2023.
//

import Foundation


final class ImageService {
    
    func imageData(url : URL, completion: @escaping(Data?,Error?) -> Void) -> Cancellable! {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                completion(nil,error)
                return
            }
            
            if let data {
                completion(data,nil)
            }
        }
        dataTask.resume()
        return dataTask
    }
}
