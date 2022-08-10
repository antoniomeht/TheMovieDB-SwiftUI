//
//  ServiceManager.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

class ServiceManager{
    
    private static let apiKey = "d14ef3d1c39000f4b702c8c4d5b2a7a4"
    private static let urlSession = URLSession.shared
    private static let jsonDecoder = JSONDecoder()

    class func loadURLAndDecode<T: Codable>(url: URL, params: [String: Any]? = nil, completion: @escaping (Result<T, MovieErrorType>) -> ()){
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else{
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        if let params = params {
            queryItems.append(contentsOf: params.map {
                URLQueryItem(name: $0.key, value: $0.value as? String)
            })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else{
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (urlData, response, error) in
            
            if error != nil{
                DispatchQueue.main.async {
                    completion(.failure(.apiError))
                }
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                DispatchQueue.main.async {
                    completion(.failure(.apiError))
                }
                return
            }
            
            guard let data = urlData else{
                DispatchQueue.main.async {
                    completion(.failure(.noResponse))
                }
                return
            }
            
            do{
                let decodedResponse = try self.jsonDecoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let error{
                print(String(describing: error))
                DispatchQueue.main.async {
                    completion(.failure(.decoding))
                }
            }

        }.resume()
    }

}
