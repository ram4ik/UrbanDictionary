//
//  ContentView.swift
//  UrbanDictionary
//
//  Created by Ramill Ibragimov on 23.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var list = [List]()
    @State private var searchWord = ""
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(self.list, id: \.id) { row in
                            ItemView(item: row)
                        }
                        Divider()
                    }
                }
            }
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .frame(height: 50)
                        .cornerRadius(25)
                        .shadow(radius: 2)
                    HStack {
                        Spacer()
                        Button(action: {
                            self.load()
                        }) {
                            Image(systemName: self.searchWord == "" ? "magnifyingglass.circle" : "arrow.2.circlepath.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                                .opacity(0.6)
                                .shadow(radius: 2)
                        }
                    }
                }
            }.padding()
        }
    }
    
    func load() {
        NetworkManager.networkRequest { data in
            DispatchQueue.main.async {
                self.list.append(contentsOf: data.list)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
