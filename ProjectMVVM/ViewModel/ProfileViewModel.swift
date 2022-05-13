//
//  ProfileViewModel.swift
//  ProjectMVVM
//
//  Created by MAC45 on 12/05/22.
//

import Foundation

class ProfileViewModel{
    let URL_API = "https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109d1"
    let appId = "626c31c5df0af1efad6b2d4c"
    var pfp : Profile? = nil

    func getDataFromAPI() async {
        do {
            var request = URLRequest(url: HelperString.getURLFromString(url: URL_API)!)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            let (data, _) = try await URLSession.shared.data(for: request)                        
            if let decoder = try? JSONDecoder().decode(Profile.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.pfp = decoder
                })
            }
        } catch {
            print("error")
        }
    }
}
