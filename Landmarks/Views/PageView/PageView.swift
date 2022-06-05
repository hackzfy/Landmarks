//
//  PageView.swift
//  Landmarks
//
//  Created by yang on 2022/6/5.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State private var currentPage = 1
    var pages: [Page]
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
