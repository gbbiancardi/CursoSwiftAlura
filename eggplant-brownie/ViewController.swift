//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 06/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!
    
    @IBAction func adicionar() {
        // var nome: String = "churros" não é necessário explicitar o tipo da variável
        // let nome = "churros" torna o parâmetro uma constante
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("Comi: \(nome) e fiquei com felicidade: \(felicidade)") // interpolação de variáveis
    }

}

