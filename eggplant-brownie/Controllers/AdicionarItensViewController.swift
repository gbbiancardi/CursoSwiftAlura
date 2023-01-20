//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Bertocco Biancardi on 20/01/23.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var caloriasTextfield: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextfield.text, let calorias = caloriasTextfield.text else { return }
        guard let numeroDeCalorias = Double(calorias) else { return }
        
        let item = Item(nome: nome, calorias: numeroDeCalorias)
        delegate?.add(item)
        
        //navegar para proxima tela: navigationController.push()
        //voltar para a tela anterior: navigationController.pop()
        navigationController?.popViewController(animated: true)
    }
}
