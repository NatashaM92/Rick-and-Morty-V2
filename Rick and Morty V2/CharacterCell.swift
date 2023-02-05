//
//  CharacterCell.swift
//  Rick and Morty V2
//
//  Created by Наталья Миронова on 04.02.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet var imageCharacter: UIImageView!
    
    @IBOutlet var nameCharacterLabel: UILabel!
    @IBOutlet var locationCharaterLabel: UILabel!
    @IBOutlet var episodeCharacterLabel: UILabel!
    
    override func prepareForReuse() {
        imageCharacter.image = nil
    }
    
    
    func configur(character: Character) {
        
        nameCharacterLabel.text = character.name
        locationCharaterLabel.text = character.location.nameLocation

}
}

