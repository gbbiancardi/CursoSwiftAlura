//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 16/01/23.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {

    let refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Churros", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController foi carregada!!!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil) // identificador da célula
        let refeicao = refeicoes[indexPath.row] // variável para ler a linha do array
        
        celula.textLabel?.text = refeicao.nome // le a variável nome do array
        
        return celula // retorna a célula na posição em questão
    }
}
