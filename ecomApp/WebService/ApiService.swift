//
//  ApiService.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")!
    
    func apiToGetEmployeeData(completion : @escaping (HomeDataModel) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(HomeDataModel.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}
