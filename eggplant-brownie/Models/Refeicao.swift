//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 09/01/23.
//

import UIKit

class Refeicao: NSObject {
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // Construtor
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}
