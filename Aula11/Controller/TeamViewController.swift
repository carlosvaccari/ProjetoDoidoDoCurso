//
//  TeamViewController.swift
//  Aula11
//
//  Created by Virtual Machine on 29/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var playerList : [Players] = [] {
        didSet{
            collectionView.reloadData()
        }
    }
    
    var teamInfos : Country?
    
    override func viewDidLoad() {
        if let urlString = teamInfos?.flag?.url, let url = URL(string: urlString) {
            teamImage.kf.setImage(with: url)
        }
        teamName.text = teamInfos?.countryName
        
        Players.getPlayers(id: (teamInfos?.id)!){ [weak self] playersList, error in
            guard let self = self else { return }
            
            print(playersList)
            
            self.playerList = playersList
        }
        
        print(teamInfos?.countryName)
    }
    
}

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath)
        return cell
    }
    
    
    
}
