//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 06/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar() {
//        ----- MÉTODO 1 ------
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
//            let nome = nomeDaRefeicao
//
//            if let felicidade = Int(felicidadeDaRefeicao) {
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//                print("Comi: \(nome) e fiquei com felicidade: \(felicidade).") // interpolação de variáveis
//            } else {
//                print("Erro ao tentar criar a refeição.")
//            }
//        }
        
//      ----- MÉTODO 2 -----
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi: \(nomeDaRefeicao) e fiquei com felicidade: \(felicidade).")
    }
}

