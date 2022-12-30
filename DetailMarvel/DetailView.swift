//
//  DetailView.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 29/12/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var labelDetalle: UILabel?
    
    var spinner: UIActivityIndicatorView?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.labelDetalle = UILabel(frame: CGRect(x: 20, y: 0, width: 350, height: 350))
        self.labelDetalle?.font = UIFont.preferredFont(forTextStyle: .footnote)
        self.labelDetalle?.textColor = .black
        self.labelDetalle?.center = CGPoint(x: 160, y: 284)
        self.labelDetalle?.textAlignment = .center
        self.labelDetalle?.numberOfLines = 0
        //self.labelDetalle?.text = "Start with AppDelegate => Prueba de texto"
        self.view.addSubview(self.labelDetalle!)
    }
}

extension DetailView: DetailViewProtocol {
 
    
    // TODO: implement view output methods
    
    func presenterPushDataView(recievedData: DetailMarvelDesc) {
        
        let description = recievedData
        self.labelDetalle?.text! += description.datoDesc
        
    }
    
    func cargarActivity() {
        DispatchQueue.main.async {
            self.spinner?.startAnimating()
        }
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.spinner?.stopAnimating()
            self.spinner?.hidesWhenStopped = true
        }
    }
    
    func showDataInLabel(data: DetailMarvelURL) {
        
        self.presenter?.pushDataDesc(sendData: data)
        
        DispatchQueue.main.async {
            let cad = data.datoURL
            let index = data.datoURL.firstIndex(of: "?")
            let urlDesc = String(cad[cad.startIndex..<index!])
            self.labelDetalle?.text = urlDesc
        }
        
        
    }
}
