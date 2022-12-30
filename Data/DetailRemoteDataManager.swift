//
//  DetailRemoteDataManager.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation
import Alamofire

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    
    var urlDetail: String = ""
    
    func getUrl(dataUrl: DetailMarvelURL) {
        self.urlDetail = dataUrl.datoURL

        
        if !self.urlDetail.isEmpty {
            _ = AF.request(self.urlDetail, method: HTTPMethod.get, encoding: JSONEncoding.default).responseDecodable(of: MarvelDetailData.self)  { response in
               switch response.result {
               case let .success(data):
                   guard var desc = data.data?.results![0].resultDescription else {return}
                   if desc.isEmpty {
                       desc = (data.data?.results![0].name)!
                   }
                   let datDesc = DetailMarvelDesc(datoDesc: desc)
                   self.remoteRequestHandler?.remoteDataManagerCallBackData(with: datDesc)
                   
               case let .failure(error):
                   print(error)
                }
            }
        }
    }
    
    
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    
    func externalGetData() {
        print()
        
    }
    
    
    
}
