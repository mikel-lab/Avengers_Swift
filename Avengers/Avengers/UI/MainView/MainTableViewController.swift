//
//  MainTableViewController.swift
//  Avengers
//
//  Created by Mikel Cobian on 7/12/21.
//

import UIKit

class MainTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    private var heroes = Heroes()
    private let heroRepository = HeroeRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroes.append(contentsOf: heroRepository.heroesSample)
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    private func navigatetoDetail(heroe: Heroe) {
        //Pillamos en 1 variable el storyboard de "Detail"
        let storyboard = UIStoryboard(name: "Detail",
                                      bundle: nil)
        //A destination le pasamos el viewcontroller inicial del storyboard que hemos sacado arriba y se lo pasamos al push para tener una navegación que nos permita volver atrás, pero tenemos que hacer que sea del tipo del viewcontroller que lo controla, as ahí el as? DetailViewController. Al ponerlo opcional hacemos ke si no es del tipo elegido, en vez de explotar simplemente devuelve un nil y no se chapa la app. Gracias a que es del tipo que queremos podemos acceder a sus propiedades y asignar a la variable héroe el valor del héroe que estamos seleccionando en el main.
        if let destination = storyboard.instantiateInitialViewController() as? DetailViewController {
            destination.heroe = heroe
            navigationController?.pushViewController(destination,
                                                     animated: true)
        }
    }
}

extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeTableViewCell",
                                                       for: indexPath) as? HeroeTableViewCell else {return UITableViewCell()}
        
        if heroes.count > indexPath.row {
            let heroe = heroes[indexPath.row]
            
            cell.configureViews(image: heroe.image,
                                title: heroe.name,
                                description: heroe.description)
    }
    
        return cell
    
}

}

 extension MainTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if heroes.count > indexPath.row {
            let selectedHeroe = heroes[indexPath.row]
            
            
            navigatetoDetail(heroe: selectedHeroe)
            
        }
    }
    
}

