//
//  AdvertTableViewCell.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 14.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import UIKit

class AdvertTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var advertImageView: UIImageView!
    
    @IBOutlet weak var saveOfflineBtn: UIImageView!
    
    @IBOutlet weak var advertDescriptionTextView: UITextView!
    
    @IBOutlet weak var advertTitleLabel: UILabel!
    
    var model:Advert?
    
    func setup(from advert: Advert) {
        if let decodedData = Data(base64Encoded: advert.image, options: .ignoreUnknownCharacters) {
            let image = UIImage(data: decodedData)
            self.advertImageView.image = image
        }
        self.advertDescriptionTextView.text = StringUtils.truncate(advert.description, length: 255)
        self.advertTitleLabel.text = StringUtils.truncate(advert.description, length: 30)
        self.model = advert
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
