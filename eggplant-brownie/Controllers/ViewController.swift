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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [ Item(nome: "Molho de tomate", calorias: 40.0),
                          Item(nome: "Queijo", calorias: 70.0),
                          Item(nome: "Molho apimentado", calorias: 30.0),
                          Item(nome: "Manjericão", calorias: 5.0)]
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        // adiciona check ao selecionar um item
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar() {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return print("Erro ao tentar criar a refeição.")
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("Comi: \(nomeDaRefeicao) e fiquei com felicidade: \(felicidade).")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

