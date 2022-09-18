//
//  MoviesRowTableViewCell.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import UIKit
import Kingfisher

typealias DidSelectClosure = ((_ section: Int?, _ idx: Int?) -> Void)

class MoviesRowTableViewCell: UITableViewCell {
    
    var didSelectClosure: DidSelectClosure?
    
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
        // cell title
        if let title = dataBase[sec].data[idx].title{
            cell.movieTitle.text = title
        }

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = moviesCollectionView.layer.frame.height
        let width = height * 0.85
        return CGSize(width: width, height: height)
    }

    // configur cell apperance
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowRadius = 7
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.masksToBounds = true

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = moviesCollectionView.tag
        didSelectClosure?(section, indexPath.row)
    }
    
}
