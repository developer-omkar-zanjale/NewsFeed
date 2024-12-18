//
//  ImageLoader.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI

class ImageLoader {
    var cache = NSCache<AnyObject, AnyObject>()
    class var sharedLoader : ImageLoader {
        struct Static {
            static let instance : ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    func imageForUrl(_ urlString: String, completionHandler:@escaping (_ image: UIImage?, _ url: String) -> ()) {
        if urlString.isEmpty {
            asyncQueue {
                completionHandler(placeholderImage, urlString)
            }
            return
        }
        
        let image: UIImage? = self.cache.object(forKey: urlString as AnyObject) as? UIImage
        if image != nil {
            asyncQueue {
                completionHandler(image, urlString)
            }
            return
        }
        guard let url = URL(string: urlString) else {
            asyncQueue {
                completionHandler(placeholderImage, urlString)
            }
            return
        }
        DispatchQueue.global(qos: .background).async {
            let downloadTask: URLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
                if (error != nil) {
                    asyncQueue {
                        completionHandler(placeholderImage, urlString)
                    }
                    return
                }
                if let data = data {
                    let image = UIImage(data: data)
                    self.cache.setObject(image as AnyObject, forKey: urlString as AnyObject)
                    asyncQueue {
                        if let image = image {
                            completionHandler(image, urlString)
                        } else {
                            completionHandler(placeholderImage, urlString)
                        }
                    }
                    return
                } else {
                    asyncQueue {
                        completionHandler(placeholderImage, urlString)
                    }
                }
            })
            downloadTask.resume()
        }
    }
}
