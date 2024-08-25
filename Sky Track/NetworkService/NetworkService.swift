//
//  NetworkService.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    func fetchData<T: Decodable>(from urlString: String, as responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
           let res =  DecodingService.shared.decode(T.self, from: data, completion: completion)
            print(data)
        }
        
        task.resume()
    }
}



