//
//  DetailPresenter.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var detail: DetailMarvelURL?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("Vista de detalle name y tengo el dato: \(String(describing: detail?.datoURL))")

        if let datoRecibido = detail {
            view?.showDataInLabel(data: datoRecibido)
        }
        
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
