//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Ruchin Somal on 29/05/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var moviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var vm = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
        setUpUI()
    }
    
    private func setUpUI() {
        
        if vm.selectedMovie.poster_path != nil {
            let urlPath = baseURL + (vm.selectedMovie.poster_path ?? "")
            ImageLoader.sharedLoader.imageForUrl(urlPath: urlPath) { [weak self] (image, _) in
                self?.moviewImageView.image = image
            }
        }
        titleLabel.text = vm.selectedMovie.title
        dateLabel.text = vm.selectedMovie.release_date
        descLabel.text = vm.selectedMovie.overview
        voteLabel.text = "Total Vote \(vm.selectedMovie.vote_count ?? 0)\nVote Avg \(vm.selectedMovie.vote_average ?? 0)"
    }
    
}
