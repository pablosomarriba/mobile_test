//
//  HomePresenter.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 28/12/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {

    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("llamada desde la vista")
        
        //Decirle al interactor que quiere traer unos datos
        interactor?.interactorGetData()
        view?.cargarActivity()
    }
    
    func showDetailView(with data: DetailMarvelURL) {
        //Vamos a llamar al wireframe
        wireFrame?.presentNewViewDetail(from: view!, withData: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {

    // TODO: implement interactor output methods

    func interactorPushDataPresenter(receiveData: [MarvelGroupData]) {
        //Le decimos a la vista que pinte los datos y pare el spinner
        view?.presenterPushDataView(recievedData: receiveData)
        view?.stopAndHideActivity()
    }
    
}
