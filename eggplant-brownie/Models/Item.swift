//
//  Item.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 09/01/23.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
