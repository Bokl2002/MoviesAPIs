//
//  FavouritMoviecellTableViewCell.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 20/09/2022.
//

import UIKit

class FavouritMoviecellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favouritMovieImage: UIImageView!
    @IBOutlet weak var favouritMovieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
