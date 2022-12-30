//
//  Environment.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 30/12/22.
//

import Foundation

class Environment {
    
    var apiURL: String = ""
    var charact: String = ""
    var charactId: String = ""
    var baseUrl: String = ""
    var apiKey: String = ""
    

    
    func getEnv() {
        var apiKeyTsHash: String {
            get {
                //let limit = 1
                let apikey = "cdb9b66985f6523d88b3b820037f895f"
                let ts = "1529959176"
                let hash = "fc9bc3330d53b8b9d28c88aa707473b7"
                //return "apikey=\(apikey)&ts=\(ts)&hash=\(hash)&limit=\(limit)"
                return "apikey=\(apikey)&ts=\(ts)&hash=\(hash)"
            }
        }
        
        var baseUrl: String {
            get {
                return "https://gateway.marvel.com/v1/public/"
            }
        }

        self.baseUrl = baseUrl
        self.charact = "characters?"
        self.charactId = "characters/"
        self.apiKey = apiKeyTsHash
        
        self.apiURL = baseUrl + self.charact + apiKeyTsHash

    }
    
}
