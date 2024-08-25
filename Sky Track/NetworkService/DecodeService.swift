//
//  DecodeService.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation

class DecodingService {
    static let shared = DecodingService()
    
    private init() {}

    func decode<T: Decodable>(_ type: T.Type, from data: Data, completion: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(.success(decodedData))
                print(decodedData.self)
            }
        } catch {
            print("Decoding failed with error: \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(.failure(.decodingFailed))
            }
        }
    }
}

