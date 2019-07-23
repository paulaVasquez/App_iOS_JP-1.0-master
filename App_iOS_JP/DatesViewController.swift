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
    @IBOutlet weak var Fecha2Label: UILabel!
    @IBOutlet weak var Equipos3Label: UILabel!
    @IBOutlet weak var Fecha3Label: UILabel!
    @IBOutlet weak var Equipos4Label: UILabel!
    @IBOutlet weak var Fecha4Label: UILabel!
    @IBOutlet weak var Equipos5Label: UILabel!
    @IBOutlet weak var Fecha5Label: UILabel!
    @IBOutlet weak var Equipos6Label: UILabel!
    @IBOutlet weak var Fecha6Label: UILabel!
    @IBOutlet weak var Equipos7Label: UILabel!
    @IBOutlet weak var Fecha7Label: UILabel!
    @IBOutlet weak var Equipos8Label: UILabel!
    @IBOutlet weak var Fecha8Label: UILabel!
    @IBOutlet weak var Equipos9Label: UILabel!
    @IBOutlet weak var Fecha9Label: UILabel!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        view.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor(red:0,green:0.4667,blue:0.1216,alpha:1.0))
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    
        
    @IBAction func pedirDatos() {
        print("envar solicitud")
        
        
        let url = URL(string: "https://api.myjson.com/bins/12klgd")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in guard let data = data else {//si existe un error se termina la funcion
            print("solicitud fallida \(String(describing: error))")//manejamos el error
            return //rompemos el bloque de codigo
            }
            
            do {//creamos nuestro objeto json
                
                print("recibimos respuesta")
                
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: String] {
                    
                    DispatchQueue.main.async {//proceso principal
                        let equipos1 = json["equipos1"]//constante
                        let fecha1 = json["fecha1"]
                        let equipos2 = json["equipos2"]
                        let fecha2 = json["fecha2"]
                        let equipos3 = json["equipos3"]
                        let fecha3 = json["fecha3"]
                        let equipos4 = json["equipos4"]
                        let fecha4 = json["fecha4"]
                        let equipos5 = json["equipos5"]
                        let fecha5 = json["fecha5"]
                        let equipos6 = json["equipos6"]
                        let fecha6 = json["fecha6"]
                        let equipos7 = json["equipos7"]
                        let fecha7 = json["fecha7"]
                        let equipos8 = json["equipos8"]
                        let fecha8 = json["fecha8"]
                        let equipos9 = json["equipos9"]
                        let fecha9 = json["fecha9"]
                        self.nombreLabel.text = equipos1//ponemos texto en labels
                        self.edadLabel.text = fecha1
                        self.paisLabel.text = equipos2
                        self.Fecha2Label.text = fecha2
                        self.Equipos3Label.text = equipos3
                        self.Fecha3Label.text = fecha3
                        self.Equipos4Label.text = equipos4
                        self.Fecha4Label.text = fecha4
                        self.Equipos5Label.text = equipos5
                        self.Fecha5Label.text = fecha5
                        self.Equipos6Label.text = equipos6
                        self.Fecha6Label.text = fecha6
                        self.Equipos7Label.text = equipos7
                        self.Fecha7Label.text = fecha7
                        self.Equipos8Label.text = equipos8
                        self.Fecha8Label.text = fecha8
                        self.Equipos9Label.text = equipos9
                        self.Fecha9Label.text = fecha9
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
