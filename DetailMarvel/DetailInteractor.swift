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
        //El interactor debe enviarle los datos al presenter
        print("Estoy obteniendo estos datos: \(category)")
        
       // for dat in category {
       //     guard let descrip = dat.data?.results?.description else {return}
       //     let marvelDetailDesc = DetailMarvelDesc(datoDesc: descrip)
       //     self.arrayMarvelDesc.append(marvelDetailDesc)
       //     print(arrayMarvelDesc)
       // }
       // print("Le paso al presenter:\(self.arrayMarvelDesc)")
        
        //Pasarle los datos al presenter
        presenter?.interactorPushDataPresenter(receiveData: category)

        
    }
}
