//
//  CharacterCollectionViewController.swift
//  Rick and Morty V2
//
//  Created by Наталья Миронова on 04.02.2023.
//

import UIKit
import Alamofire

class CharacterCollectionViewController: UICollectionViewController {
    
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }
    
    private func fetchCharacters() {
                NetworkManager.shared.fetchCharacters(url: Link.url.rawValue) { result in
                    switch result {
                    case .success(let characters):
                        self.characters = characters
                        self.collectionView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
        
    }
}
// MARK: UICollectionViewDataSource

extension CharacterCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "character", for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
        
        let character = characters[indexPath.item]
        
       // cell.configur(character: character)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 180)
    }
}
    


