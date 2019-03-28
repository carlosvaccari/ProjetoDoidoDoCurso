//
//  CountriesListTableViewCell.swift
//  Aula11
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit

class CountriesListTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
