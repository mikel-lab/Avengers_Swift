//
//  VillanosTableViewController.swift
//  Avengers
//
//  Created by Mikel Cobian on 10/12/21.
//

import UIKit

class VillanosTableViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView?
    
    private var villanos = Villanos()
    private let villanosRepository = VillanoRepository()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.villanos.removeAll()
        DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        villanos.append(contentsOf: villanosRepository.villanosSample)
        
        tableView?.dataSource = self
        tableView?.delegate = self

        }
    
  /*  private func navigatetoDetail(villano: Villano) {
        //Pillamos en 1 variable el storyboard de "Detail"
        let storyboard = UIStoryboard(name: "Detail",
                                      bundle: nil)
        //A destination le pasamos el viewcontroller inicial del storyboard que hemos sacado arriba y se lo pasamos al push para tener una navegación que nos permita volver atrás, pero tenemos que hacer que sea del tipo del viewcontroller que lo controla, as ahí el as? DetailViewController. Al ponerlo opcional hacemos ke si no es del tipo elegido, en vez de explotar simplemente devuelve un nil y no se chapa la app. Gracias a que es del tipo que queremos podemos acceder a sus propiedades y asignar a la variable héroe el valor del héroe que estamos seleccionando en el main.
        if let destination = storyboard.instantiateInitialViewController() as? DetailViewController {
            destination.heroe = heroe
            navigationController?.pushViewController(destination,
                                                     animated: true)
        }
    }*/
}

extension VillanosTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return villanos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VillanoTableViewCell",
                                                       for: indexPath) as? VillanoTableViewCell else {return UITableViewCell()}
        
        if villanos.count > indexPath.row {
            let villano = villanos[indexPath.row]
            
            cell.configureViews(image: villano.image,
                                title: villano.name,
                                description: villano.description)
    }
    
        return cell
    
}

}

 extension VillanosTableViewController: UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if villanos.count > indexPath.row {
            let selectedVillano = villanos[indexPath.row]
           print("dddffg")
            
           // navigatetoDetail(heroe: selectedVillano)
            
        }
    }*/
    
}
