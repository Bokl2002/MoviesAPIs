//
//  MoviesRowTableViewCell.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import UIKit
import Kingfisher

class MoviesRowTableViewCell: UITableViewCell {
    
    // outlets
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

// MARK: collection View

extension MoviesRowTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    // sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let idx = moviesCollectionView.tag
        return dataBase[idx].data.count
    }
    
    // cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        // position in data base
        let sec = moviesCollectionView.tag
        let idx = indexPath.row
        // image and image url
        if let path = dataBase[sec].data[idx].poster_path{
            let url = "https://image.tmdb.org/t/p/w500\(path)"
            cell.movieImageView.kf.setImage(with: URL(string: url))
        }
        cell.movieImageView.layer.cornerRadius = 20
        // movie title
        if let title = dataBase[sec].data[idx].title{
            cell.movieTitle.text = title
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = moviesCollectionView.layer.frame.height
        let width = height * 0.80
        return CGSize(width: width, height: height)
    }
    
}
