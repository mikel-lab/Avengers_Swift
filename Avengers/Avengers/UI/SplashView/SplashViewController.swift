//
//  SplashViewController.swift
//  Avengers
//
//  Created by Mikel Cobian on 2/12/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        activityIndicator?.startAnimating()
        navigateNext()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        activityIndicator?.stopAnimating()
    }
    
    //window?.makeKeyAndVisible()
    
    //MARK: - Navigation
    
    private func navigateNext() {
        
        //Ponemos un pequeño delay para que la transición no sea fea y dentro el código de la navegación
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self]  in
            
         /*   self?.performSegue(withIdentifier: .segueSplashMain,
                                sender: nil) */
            
            
        
        //Instanciamos el storyboard al que queremos viajar
        
            let storyboardMain = UIStoryboard(name: .storyboardMain,
                                              bundle: nil)
            
            //Desempaquetamos la variable con el destino al que queremos navegar, ya que el navigationcontroller es opcional.
            //Le hacemos un setViewcontroller para borrar la pila de navegacion y añadir el viewcontroller 'destination' a esa pila
            //para que no haya vuelta atrás desde la pantalla a la que se dirije.
            
            if let destination = storyboardMain.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination],
                                                               animated: true)
            } 
            
        }
        
    }
    
    
}

//MARK: - Extensiones

private extension String {
    static let storyboardMain = "Main"
    static let segueSplashMain = "SEGUE_SPLASH_MAIN"
}
