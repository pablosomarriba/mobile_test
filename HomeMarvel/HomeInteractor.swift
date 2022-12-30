//
//  HomeInteractor.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 28/12/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    var arrayMarvel =  [MarvelGroupData]()
    
    func interactorGetData() {
        //Decirle a la capa de conexión external data manager que tiene que traer unos datos
        remoteDatamanager?.externalGetData()
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func remoteDataManagerCallBackData(with category: [MarvelGroupData]) {
        //El interactor debe enviarle los datos al presenter
        print("Estoy obteniendo estos datos: \(category)")
        
        //Recorrer el objeto category y conforma el objeto DatoURL
        for dat in category {
            let marvelGroup = MarvelGroupData(id: dat.id, name: dat.name, image: dat.image)
            self.arrayMarvel.append(marvelGroup)
            print(arrayMarvel)
        }
        print("Le paso al presenter:\(self.arrayMarvel)")
        
        //Pasarle los datos al presenter
        presenter?.interactorPushDataPresenter(receiveData: self.arrayMarvel)

        
    }
}
