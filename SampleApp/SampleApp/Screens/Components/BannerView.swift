//
//  BannerView.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/4/7.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import SwiftUI
import RealifeTech

struct BannerView: View, RLTViewCreatable {

    private var header: String?
    private var subtitle: String?
    private var imageUrl: URL?
    private var linkHandler: (() -> Void)?
    @ObservedObject private var imageLoader: ImageLoader

    private let idealImageHeight = UIScreen.main.bounds.size.width * 0.46

    init(title: String?,
         subtitle: String?,
         imageUrl: URL?,
         linkHandler: @escaping () -> Void
    ) {
        self.header = title
        self.subtitle = subtitle
        self.imageUrl = imageUrl
        self.imageLoader = ImageLoader(url: imageUrl)
        self.linkHandler = linkHandler
    }

    var body: some View {
        VStack(alignment: .leading) {
            if #available(iOS 15.0, *) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity, idealHeight: idealImageHeight, alignment: .center)
                        .clipped()
                } placeholder: {
                    Color.gray
                        .frame(minWidth: 0, maxWidth: .infinity, idealHeight: idealImageHeight)
                }
            } else {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, idealHeight: idealImageHeight, alignment: .center)
                }
            }
            Spacer()
            if let header = header {
                Text(header)
            }
            Spacer()
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
        .onTapGesture {
            linkHandler?()
        }
    }
}

struct BannerViewFactory: RLTBannerFactory {

    func create(from dataModel: RLTBanner) -> RLTCreatable? {
        return BannerView(
            title: dataModel.title,
            subtitle: dataModel.subtitle,
            imageUrl: dataModel.imageUrl,
            linkHandler: dataModel.generateLinkHandler(openHandler: { url in
                UIApplication.shared.open(url, options: [:])
            })
        )
    }
}

// You could create and use your own Fetcher instead of using our default:
protocol ExampleMediaType { }
extension BannerView: ExampleMediaType { }
class ExampleFetcher: RLTMediaTypeFetching {
    typealias MediaType = ExampleMediaType
    var factories: [RLTContentType: RLTCreatableFactory] = [.banner: BannerViewFactory()]
}
/*
 ExampleFetcher().fetch(location: "location-id") { result in in }
 (All results would be guaranteed to conform to ExampleMediaType)
*/
