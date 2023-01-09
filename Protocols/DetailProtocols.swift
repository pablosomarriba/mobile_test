//
//  DetailProtocols.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    
    func presenterPushDataView(recievedData: DetailMarvelDesc)
    func cargarActivity()
    func stopAndHideActivity()

    func showDataInLabel(data: DetailMarvelURL)
}

protocol DetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with data: DetailMarvelURL) -> UIViewController
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var detail: DetailMarvelURL? {get set}
    func viewDidLoad()
    func pushDataDesc(sendData: DetailMarvelURL )
}

protocol DetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter( receiveData:DetailMarvelDesc )
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    
    //Función que permite al interactor gestionar datos con la ejecución
    func pushDataDesc(sendData: DetailMarvelURL )
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    func getUrl(dataUrl: DetailMarvelURL)
}

protocol DetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with category: DetailMarvelDesc)
}

protocol DetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
