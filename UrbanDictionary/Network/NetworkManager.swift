//
//  NetworkManager.swift
//  UrbanDictionary
//
//  Created by Ramill Ibragimov on 23.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static func networkRequest(_ searchWord: String? = nil, completionHandlerAfter: @escaping(AllItems) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com",
            "x-rapidapi-key": "2029723d72msha38e93b72627b63p19f422jsn2dd3b46d1d90"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=cat")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription as Any)
            } else {
                if let newData: AllItems = try? JSONDecoder().decode(AllItems.self, from: data!) {
                    completionHandlerAfter(newData)
                }
            }
        })

        dataTask.resume()
    }
}
