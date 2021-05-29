//
//  MovieCell.swift
//  MovieApp
//
//  Created by Ruchin Somal on 29/05/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var moviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(forIndexPath indexPath: IndexPath = IndexPath(row: 0, section: 0), withObject obj: Any? = nil) {
        if let cObj = obj as? MovieModel {
            if cObj.poster_path != nil {
            let urlPath = baseURL + (cObj.poster_path ?? "")
            ImageLoader.sharedLoader.imageForUrl(urlPath: urlPath) { [weak self] (image, _) in
                self?.moviewImageView.image = image
            }
            }
            titleLabel.text = cObj.title
            dateLabel.text = cObj.release_date
            descLabel.text = cObj.overview
        }
    }
    
}
