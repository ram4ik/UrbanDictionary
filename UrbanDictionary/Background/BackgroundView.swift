//
//  BackgroundView.swift
//  UrbanDictionary
//
//  Created by Ramill Ibragimov on 23.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("bgLight"), Color("bgDark")]), startPoint: .bottomTrailing, endPoint: .topLeading)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
