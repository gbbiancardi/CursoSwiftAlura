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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                          Item(nome: "Queijo", calorias: 70.0),
                          Item(nome: "Molho apimentado", calorias: 30.0),
                          Item(nome: "Manjericão", calorias: 5.0)]
    var itensSelecionados: [Item] = []
    
    // MARK: - View life cycle
    
    // Ações para quandoa  view acabou de ser carregada
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        guard let diretorio = recuperaDiretorio() else { return }
        
        do {
            let dados = try Data(contentsOf: diretorio)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return }
            itens = itensSalvos
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
                    tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela.")
        }
        
        guard let caminho = recuperaDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appending(path: "itens")
        
        return caminho
    }
 
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
    
    func recuperaRefeicaoDoFormulario () -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else { return nil }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else { return nil }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        return refeicao
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar() {
        guard let refeicao = recuperaRefeicaoDoFormulario() else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário.")
            return
        }
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

