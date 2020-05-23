//
//  ItemView.swift
//  UrbanDictionary
//
//  Created by Ramill Ibragimov on 23.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI
import SafariServices

struct ItemView: View {
    @State var item: List
    
    var body: some View {
        VStack {
            HStack {
                Text("\(item.word?.capitalized ?? "n/a")")
                    .bold()
                    .padding(.vertical)
                Spacer()
                if item.permalink != "" {
                    Button(action: {
                        if let url = URL(string: self.item.permalink ?? "") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "arrow.turn.up.right")
                    }
                }
            }
            Text("  \(item.definition?.capitalized ?? "n/a")")
                
            HStack {
                Spacer()
                Text("by \(item.author ?? "n/a")")
                    .font(.footnote)
            }
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "hand.thumbsup")
                        .offset(y: -5)
                    Text("\(item.thumbs_up ?? 0)")
                        .font(.footnote)
                    Image(systemName: "hand.thumbsdown")
                        .offset(y: 5)
                    Text("\(item.thumbs_down ?? 0)")
                        .font(.footnote )
                }.opacity(0.6)
            }
            
        }.padding()
    }
}
