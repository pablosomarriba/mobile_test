//
//  HomeRemoteDataManager.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 28/12/22.
//  
//

import Foundation
import Alamofire


class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var marvelListData = [MarvelListData]()
    var arrayMarvel =  [MarvelGroupData]()
    let myGroup = DispatchGroup()
    let env = Environment()
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, name: String, id: Int, urlId: String) {

        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                self.myGroup.leave()
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() {
                self.myGroup.leave()
                let imgMarvel =  UIImage(data: data)
                let groupMarvel = MarvelGroupData(id: id, name: name,image: imgMarvel!,url: urlId )
                self.arrayMarvel.append(groupMarvel)
            }
        }
    }
    
    func externalGetData() {
                        
        env.getEnv()
        
        _ = AF.request(env.apiURL,method: HTTPMethod.get, encoding: JSONEncoding.default).responseDecodable(of: MarvelListData.self) { response in
            switch response.result {
            case let .success(data):
                                
                for datMarvel in data.data?.results ?? [] {
                    self.myGroup.enter()
                    guard let idMarvel = datMarvel.id else {return}
                    guard let nameMarvel = datMarvel.name else {return}
                    guard let imageMarvelUrl = datMarvel.thumbnail?.path else {return}
                    guard let imageMarvelExt = datMarvel.thumbnail?.thumbnailExtension?.rawValue else {return}
                    let urlId = self.env.baseUrl + self.env.charactId + String(idMarvel) + "?" + self.env.apiKey
                    let imageMarvel = imageMarvelUrl + "." + imageMarvelExt
                    let url = URL(string: imageMarvel)
                    self.downloadImage(from: url!, name: nameMarvel, id: idMarvel, urlId: urlId )
                }
                
                //Enviar de vuelta los datos al interactor
                self.myGroup.notify(queue: .main) {
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.arrayMarvel)
                }
                
            case let .failure(error):
                print(error)
            }
        }
        
        
        
    }
    
}
