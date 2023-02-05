//
//  Character.swift
//  Rick and Morty V2
//
//  Created by Наталья Миронова on 04.02.2023.
//

import Foundation

struct CharacterApp: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let location: LastLocation
    let image: String
    let episode: [String]
    
    init(value: [String: Any]) {
        name = value["name"] as? String ?? ""
        let locationDict = value["location"] as? [String: String]
        location = LastLocation(value: locationDict ?? [:])
        image = value["image"] as? String ?? ""
        episode = value["episode"] as? [String] ?? []
        
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let value = value as? [String: Any] else { return []}
        guard let results = value["results"] as? [[String: Any]] else { return []}

        var characters = [Character]()
        
        for result in results {
            let character = Character(value: result)
            characters.append(character)
        }
        return characters
    }
} 

struct LastLocation: Decodable {
    let nameLocation: String

    init(value: [String: String]) {
        nameLocation = value["name"] as? String ?? ""
    }
}

//struct Episode: Decodable {
//    let name: String
//    
//    init(value: [String: Any]) {
//        name = value["name"] as? String ?? ""
//    }
//    
//    static func getEpisode(from value: Any) -> String {
//        guard let value = value as? [String: Any] else { return ""}
//        let episode = Episode(value: value)
//        return episode
//    }
//}
