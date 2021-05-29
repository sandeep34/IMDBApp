//
//  ViewController.swift
//  MovieApp
//
//  Created by Ruchin Somal on 29/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblList: UITableView!
    
    private let vm = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies" 
        configureCell()
        vm.parseJsonFile()
    }
    
    
    private func configureCell() {
        tblList.register(UINib(nibName: "MovieCell" , bundle: Bundle.main), forCellReuseIdentifier: "MovieCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.movieArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = vm.movieArr[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
                return UITableViewCell()
            }
            cell.setupCell(forIndexPath: indexPath, withObject: obj)
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.selectedMovie = vm.movieArr[indexPath.row]
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.vm = vm
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
