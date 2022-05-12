//
//  ImageLoader.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/4/7.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI

final class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    init(url: URL?) {
        loadImageFromUrl(url)
    }

    private func loadImageFromUrl(_ url: URL?) {
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            DispatchQueue.main.async {
                guard let loadedImage = UIImage(data: data) else {
                    return
                }
                self.image = loadedImage
            }
        }
        task.resume()
    }
}
