//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 16/01/23.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {

    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Churros", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController foi carregada!!!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // o _ é para identificar que é a instância da tableView
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil) // identificador da célula
        let refeicao = refeicoes[indexPath.row] // variável para ler a linha do array
        
        celula.textLabel?.text = refeicao.nome // le a variável nome do array
        
        return celula // retorna a célula na posição em questão
    }
    
    func add(_ refeicao: Refeicao) {
        print("Método add está sendo chamado! \(refeicao.nome) add!")
        refeicoes.append(refeicao)
        tableView.reloadData() // faz atualizar a table view
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // método para interceptar as telas de interligadas e conseguir manipular a interação
        if let viewController = segue.destination as? ViewController {
            viewController.tableViewController = self
        }
    }
}
