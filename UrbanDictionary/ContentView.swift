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
    @State private var searchWord: String = ""
    @State private var showSearchWordMenu = true
    @State private var value: CGFloat = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
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
            VStack(alignment: .trailing) {
                Spacer()
                ZStack {
                    if showSearchWordMenu {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("searchBar"))
                                .opacity(0.8)
                                .frame(height: 50)
                                .cornerRadius(25)
                                .shadow(radius: 2)
                            
                            TextField("Search...", text: $searchWord)
                                .accessibility(label: Text("searchField"))
                                .padding(.horizontal, 40)
                        }.offset(y: -self.value)
                        .animation(.spring())
                        .onAppear() {
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                                let height = value.height

                                self.value = height
                            }
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in

                                self.value = 0
                            }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: self.searchWord == "" ? "magnifyingglass.circle" : "arrow.2.circlepath.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.6)
                                .shadow(radius: 2)
                        }.onTapGesture {
                            self.loadData()

                        }.onLongPressGesture {
                            self.showSearchWordMenu = true
                        }
                        .accessibility(label: Text("searchButton"))
                    }
                }
            }.padding()
        }
    }
    
    func loadData() {
        NetworkManager.networkRequest(searchWord) { data in
            DispatchQueue.main.async {
                self.list = [List]()
                self.list.append(contentsOf: data.list)
                withAnimation {
                    self.showSearchWordMenu = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
