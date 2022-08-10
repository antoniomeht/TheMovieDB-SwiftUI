//
//  ImageLoader.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import SwiftUI
import UIKit
import RxSwift
import Nuke
import RxNuke

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    let disposeBag = DisposeBag()
    
    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

            ImagePipeline.shared.rx.loadImage(with: url)
                .subscribe(onSuccess: {
                    self.image = $0.image
                    self.imageCache.setObject($0.image, forKey: urlString as AnyObject)
                })
                .disposed(by: self.disposeBag)
    }
}
