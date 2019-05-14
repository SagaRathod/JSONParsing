//
//  CustomTableViewCell.swift
//  Demo_SagarRathode
//
//  Created by Sagar Rathode on 02/12/17.
//  Copyright © 2017 Sagar Rathode. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblAlpha2Code: UILabel!
    @IBOutlet weak var lblAlpha3Code: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
