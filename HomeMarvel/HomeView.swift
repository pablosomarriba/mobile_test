//
//  HomeView.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 28/12/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    var tableView: UITableView?
    var spinner: UIActivityIndicatorView?
    
    var arrayViewMarvel =  [MarvelGroupData]()

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        //Añadir tableview
        self.view.backgroundColor = .white
        self.tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.backgroundColor = .white
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView!)
        
        //Añadimos spinner
        self.spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        self.spinner?.color = .black
        self.spinner?.style = .medium
        // Position Activity Indicator in the center of the main view
        self.spinner?.center = view.center
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        self.spinner?.hidesWhenStopped = false
        self.view.addSubview(self.spinner!)
            
    }
}

extension HomeView: HomeViewProtocol {

    

    // TODO: implement view output methods
    
    //Esto sería una inyección de dependencias => Pasar los datos de un objeto a otro
    func presenterPushDataView(recievedData: [MarvelGroupData]) {
        
        arrayViewMarvel = recievedData
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
        
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
    
}


extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayViewMarvel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
        
        let xOffsetImg: CGFloat = 10
        //let contentViewFrame = cell.contentView.frame
        let imageView = UIImageView()
        imageView.image = self.arrayViewMarvel[indexPath.row].image
        imageView.frame = CGRectMake(xOffsetImg, CGFloat(0), CGFloat(30), CGFloat(30))
        cell.contentView.addSubview(imageView)

        let xOffsetTxt: CGFloat = 50
        let textName = UILabel()
        textName.textColor = .black
        textName.text = self.arrayViewMarvel[indexPath.row].name
        textName.frame = CGRectMake(xOffsetTxt, CGFloat(0), CGFloat(250), CGFloat(30))
        cell.contentView.addSubview(textName)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //presenter?.showDetailView(with: MarvelGroupData(name: self.arrayViewMarvel[indexPath.row].name, image: self.arrayViewMarvel[indexPath.row].image))
    }
    
    
}

