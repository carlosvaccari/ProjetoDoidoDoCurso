//
//  CountriesListViewController.swift
//  Aula11
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit
import Kingfisher

class CountriesViewController: UIViewController {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var countryList : [Country] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        tableView.register(UINib(nibName: "CountriesListTableViewCell", bundle: nil), forCellReuseIdentifier: "countryCell")
        
        Country.getCountries { [weak self] countryList, error in
            guard let self = self else { return }
            
            print(countryList)
            
            self.countryList = countryList
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToTeam" {
            let vc = segue.destination as! TeamViewController
            vc.teamInfos = sender as? Country
        }
        
    }
    
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountriesListTableViewCell
        cell.countryName.text = countryList[indexPath.row].countryName
        if let urlString = countryList[indexPath.row].flag?.url, let url = URL(string: urlString) {
            cell.countryImage.kf.setImage(with: url)
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TCHAU \(countryList[indexPath.row])")
        performSegue(withIdentifier: "goToTeam", sender: countryList[indexPath.row])
    }
    

    
}
