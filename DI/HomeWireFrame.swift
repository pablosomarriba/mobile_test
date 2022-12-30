//
//  HomeWireFrame.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 28/12/22.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    class func createHomeModule() -> UIViewController {
        let viewController = HomeView()
        let navigationController =  UINavigationController(rootViewController: viewController)
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return navigationController
    }
    
    func presentNewViewDetail(from view: HomeViewProtocol, withData: DetailMarvelURL) {
        
        //Añadir nuevo modulo e instanciarlo Detail
        let newDetailView = DetailWireFrame.createDetailModule(with: withData)
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    
}
