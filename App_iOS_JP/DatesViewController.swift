//
//  DatesViewController.swift
//  App_iOS_JP
//
//  Created by PaulaIOS on 7/22/19.
//  Copyright © 2019 ApliMovil. All rights reserved.
//

import UIKit
import Foundation

class DatesViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var edadLabel: UILabel!
    
    @IBOutlet weak var paisLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
    
    
        
    @IBAction func pedirDatos() {
        print("envar solicitud")
        
        
        let url = URL(string: "https://api.myjson.com/bins/16lwxp")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in guard let data = data else {//si existe un error se termina la funcion
            print("solicitud fallida \(String(describing: error))")//manejamos el error
            return //rompemos el bloque de codigo
            }
            
            do {//creamos nuestro objeto json
                
                print("recibimos respuesta")
                
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: String] {
                    
                    DispatchQueue.main.async {//proceso principal
                        let nombre = json["nombre"]//constante
                        let edad = json["edad"]//variable
                        let pais = json["pais"]
                        self.nombreLabel.text = nombre//ponemos el texto en los textfield
                        self.edadLabel.text = edad
                        self.paisLabel.text = pais
                    }
                    
                    
                }
                
                
            } catch let parseError {//manejamos el error
                print("error al parsear: \(parseError)")
                let responseString = String(data: data, encoding: .utf8)
                print("respuesta : \(String(describing: responseString))")
            }
        }
        task.resume()

    }
    
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }
