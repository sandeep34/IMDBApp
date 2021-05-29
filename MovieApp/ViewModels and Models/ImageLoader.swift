//
//  ImageLoader.swift
//  MovieApp
//
//  Created by Ruchin Somal on 2021-05-01.
//

import Foundation
import UIKit

class ImageLoader {
    let imageCache = NSCache<NSString, UIImage>()

    class var sharedLoader: ImageLoader {
        struct Static {
            static let instance: ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    private init() {}
    
    func imageForUrl(urlPath: String, completionHandler: @escaping (_ image: UIImage?, _ url: String) -> Void) {
        guard let url = urlPath.toUrl else {
            return
        }
        if let image = imageCache.object(forKey: urlPath as NSString) {
            completionHandler(image, urlPath)
        } else {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let finalData = data else { return }
                DispatchQueue.main.async {
                    if let img = UIImage(data: finalData) {
                        self.imageCache.setObject(img, forKey: urlPath as NSString)
                         completionHandler(img, urlPath)
                    }
                }
            }.resume()
        }
    }
}
extension String {
    var toUrl: URL? {
        if self.hasPrefix("https://") || self.hasPrefix("http://") {
            return URL(string: self)
        } else {
            return URL(fileURLWithPath: self)
        }
    }
}
