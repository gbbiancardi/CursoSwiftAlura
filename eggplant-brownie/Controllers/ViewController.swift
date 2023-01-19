//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 06/01/23.
//

import UIKit

// relativo a interface em Java
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController {

    var delegate: AdicionaRefeicaoDelegate?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar() {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi: \(nomeDaRefeicao) e fiquei com felicidade: \(felicidade).")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

