//
//  PageView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/9/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// How to get UIPageControl (from UIKIT) into swiftUI to animate thanks to Fabian at https://stackoverflow.com/questions/57391615/swiftui-page-control-implementation

import Foundation
import SwiftUI
import Combine

struct PagesView : View {
    let limit: Double = 15
    let step: Double = 0.3

    @State var pages: [Page] = (0...3).map { i in
        Page(title: MockData.title, imageName: MockData.imageNames[i], content: MockData.contentStrings[i])
    }

    @State var currentIndex = 0
    @State var nextIndex = 1

    @State var progress: Double = 0

    @State private var shape = AnyView(Circle().foregroundColor(.blue).frame(width: 60.0, height: 60.0, alignment: .center))

    var body: some View {
        ZStack {
            Button(action: {
                self.refreshAnimatingViews()
            }) { self.shape
            }.offset(y: 300)

            PageView(page: pages[currentIndex])
                .offset(x: -CGFloat(pow(2, self.progress)))
            PageView(page: pages[nextIndex])
                .offset(x: CGFloat(pow(2, (self.limit - self.progress))))
        }.edgesIgnoringSafeArea(.vertical)
    }

    func refreshAnimatingViews() {
        currentIndex = nextIndex
        if nextIndex + 1 < pages.count {
            nextIndex += 1
        } else {
            nextIndex = 0
        }
    }
}

struct Page {
    var title: String
    var imageName: String
    var content: String
    let imageWidth: CGFloat = 150
}

struct PageView: View {
    var page: Page

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text(page.title).font(Font.system(size: 40)).fontWeight(.bold).lineLimit(nil)
            Image(page.imageName)
                .resizable()
                .frame(width: page.imageWidth, height: page.imageWidth)
                .cornerRadius(page.imageWidth/2)
                .clipped()
            Text(page.content).font(.body).lineLimit(nil)
        }.padding(60)
    }
}

struct MockData {
    static let title = "Eating grapes 101"
    static let contentStrings = [
        "Step 1. Break off a branch holding a few grapes and lay it on your plate.",
        "Step 2. Put a grape in your mouth whole.",
        "Step 3. Deposit the seeds into your thumb and first two fingers.",
        "Step 4. Place the seeds on your plate."
    ]
    static let imageNames = [
        "screen 1",
        "screen 2",
        "screen 3",
        "screen 4"
    ]
}
