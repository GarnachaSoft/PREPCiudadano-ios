//
//  MainManuVC.swift
//  PrepCiudadanoMexico
//
//  Created by Juan Villalvazo on 18/05/18.
//  Copyright © 2018 Juan Villalvazo. All rights reserved.
//

import UIKit

class MainManuVC: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
   
    
    let imagenes = [UIImage(named:"tutoriales de programacion")]
    let titulos = ["Colaborar","Encuentra tu casilla","Resultados","PREP","Incidencias","Donativos","Sobre Nosotros"]
    let descripciones = ["Su apoyo es importante","Encuentre la casilla mas cercana","Consulta los resultados en tiempo real","Sobre el PREP","Incidencias en tiempo real","Tu aporte hace la diferencia","Nuestro equipo de trabajo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titulos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Recuperamos nuestra celda del storyboard como hija de la clase CollectionViewCell y le damos sus atributos.
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CollectionViewCell
        
        celda.imagen.image = imagenes[0]
        celda.titulo.text = titulos[indexPath.row]
        celda.descripcion.text = descripciones[indexPath.row]
        
        
        //Crea sombras y modifica la apariencia de nuestra celda
        celda.contentView.layer.cornerRadius = 4.0
        celda.contentView.layer.borderWidth = 1.0
        celda.contentView.layer.borderColor = UIColor.clear.cgColor
        celda.contentView.layer.masksToBounds = false
        celda.layer.shadowColor = UIColor.gray.cgColor
        celda.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        celda.layer.shadowRadius = 4.0
        celda.layer.shadowOpacity = 1.0
        celda.layer.masksToBounds = false
        celda.layer.shadowPath = UIBezierPath(roundedRect: celda.bounds, cornerRadius: celda.contentView.layer.cornerRadius).cgPath
        
        
        return celda
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
