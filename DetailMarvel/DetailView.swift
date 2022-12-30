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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.labelDetalle = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
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
    
    func showDataInLabel(data: DetailMarvelURL) {
            
        DispatchQueue.main.async {
            self.labelDetalle?.text = data.datoURL
        }
        
        
    }
}
