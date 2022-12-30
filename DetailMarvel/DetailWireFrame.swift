//
//  DetailWireFrame.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    static func createDetailModule(with data: DetailMarvelURL) -> UIViewController {
        
        let viewController = DetailView()
        
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.detail = data
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return viewController
        
    }
    
}
