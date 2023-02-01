//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 16/01/23.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {

    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Churros", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 5)]
    
    override func viewDidLoad() {
        guard let caminho = recuperaCaminho() else { return }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return }
            refeicoes = refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appending(path: "refeicao")
        
        return caminho
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // o _ é para ocultar o parâmetro da variável quando o método for invocado. Caso seja necessário mostrar, basta não colocar o _
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil) // identificador da célula
        let refeicao = refeicoes[indexPath.row] // variável para ler a linha do array
        celula.textLabel?.text = refeicao.nome // le a variável nome do array
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula // retorna a célula na posição em questão
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData() // faz atualizar a table view
        
        guard let caminho = recuperaCaminho() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            // exemplo de closure
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    
    
    // método para interceptar as telas de interligadas e conseguir manipular a interação
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // coloca-se o for para aparecer como nome do parâmetro apenas para quando o método for invocado. Internamente o método não encherga o for
        
        if segue.identifier == "adicionar" { // garante que o segue que estamos preparando é o que existe e foi identificado
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        } else {
            print("Erro: segue diferente da identificada!")
        }
    }
}
