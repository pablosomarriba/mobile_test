//
//  DetailInteractor.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    
    var arrayMarvelDesc = [DetailMarvelDesc]()
    
    func interactorGetData() {
        //Decirle a la capa de conexión external data manager que tiene que traer unos datos
        remoteDatamanager?.externalGetData()
    }
    
    func pushDataDesc(sendData: DetailMarvelURL) {
        remoteDatamanager?.getUrl(dataUrl: sendData)
    }

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackData(with category: DetailMarvelDesc) {

        //Pasarle los datos al presenter
        presenter?.interactorPushDataPresenter(receiveData: category)

        
    }
}
