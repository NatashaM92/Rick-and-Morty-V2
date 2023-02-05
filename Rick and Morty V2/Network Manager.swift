//
//  Network Manager.swift
//  Rick and Morty V2
//
//  Created by Наталья Миронова on 04.02.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case url = "https://rickandmortyapi.com/api/character"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacters(url: String, completion: @escaping(Result<[Character], AFError>) -> Void) {
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let characters = Character.getCharacters(from: value)
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
//    func fetchEpisode(url: String, completion: @escaping(Result<Episode, AFError>) -> Void) {
//        AF.request(url, method: .get)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    let  = Character.getCharacters(from: value)
//                    completion(.success())
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//    
//    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
//            AF.request(url)
//                .responseData { response in
//                    switch response.result {
//                    case .success(let imageData):
//                        completion(.success(imageData))
//                    case .failure(let error):
//                        completion(.failure(error))
//                    }
//                }
//        }
    
}
            
