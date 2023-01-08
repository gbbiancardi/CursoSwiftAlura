import UIKit

/* let nome = "morango"
let felicidade = 5
let calorias = 79.5
let vegetal = true

//func alimentoConsumido() {
//    print("O alimento consumido foi: \(nome)")
//}
//
//alimentoConsumido()

// func alimentoConsumido(nome: String, caloria: Double) -> forma explícita de declarar os parâmetros
// Para declarar apenas a variável que irá de parâmetro, coloca-se o _ e um espaço antes do nome do parâmetro no método
func alimentoConsumido(_ nome: String, _ caloria: Double) {
    print("O alimento consumido foi \(nome) e ele possui \(caloria) calorias.")
}

alimentoConsumido(nome, calorias) */

// ------------- ARRAYS --------------

//let totalDeCalorias = [50.5, 100, 300, 500, 450]
//print(totalDeCalorias)

// primeira forma de escrever um for:

//for i in 0...3 {
//    print(i)
//    print(totalDeCalorias[i])
//}

// segunda forma de escrever um for:

//for i in 0...totalDeCalorias.count-1 {
//    print(i)
//    print(totalDeCalorias[i])
//}

// terceira forma de escrever um for:

//for caloria in totalDeCalorias {
//    print(caloria)
//}

// --------- ARRAY POR PARÂMETRO ----------

//let totalDeCalorias = [50.5, 100]

/*
 Pode declarar como Array<Double> ou simplesmente [Double]
 Quando um método possui um retorno, é necessário indicar qual o retorno previsto utilizando -> (tipo de retorno esperado)
 */
//func todasCalorias(totalDeCalorias: [Double]) -> Double {
//    var total: Double = 0 // necessário declarar a variável de forma explícita neste caso
//
//    for caloria in totalDeCalorias {
//        total += caloria
//    }
//
//    return total
//}
//
//let total = todasCalorias(totalDeCalorias: [50.5, 100, 400])
//
//print(total)

// ------ CLASSES INSTÂNCIAS OBJETOS E PROPRIEDADES ------

//class Refeicao {
//    // Optional Chain = A variável pode ou não ter valores
//    var nome: String?
//    var felicidade: String?
//}

// Instanciando uma classe:

//let refeicao = Refeicao()
// ou pode ser => let refeicao: Refeicao = Refeicao()

//refeicao.nome = "Macarrão"

// Cuidado => Forced Unwrap -> retira a informação que o valor da variável é opcional. EVITAR AO MÁXIMO!!!
//print(refeicao.nome!)

// --- Boas práticas para extrair valores opcionais:

//if let nome = refeicao.nome {
//    print(nome)
//}

// guard let
//func exibeNomeDaRefeicao() {
//    if let nome = refeicao.nome {
//        print(nome)
//    }
//
//    // O guard let permite que a constante criada possa ser utilizada fora de seu escopo
//    // Usado quando é necessário verificar muitos valores
//    guard let nome = refeicao.nome else {
//        return
//    }
//
//    print(nome)
//}
//
//exibeNomeDaRefeicao()
//
//let numero = Int("5")
//
//if let n = numero {
//    print(n)
//} else {
//    print("Erro ao converter String para Int.")
//}




// ------ GOOD CITIZEN - CRIANDO CLASSES QUE NUNCA QUEBRAM ------

class Refeicao {
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // Construtor
    init(nome: String, felicidade: String) {
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

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 90.0)
let contraFile = Item(nome: "Contra filé", calorias: 287.0)

let refeicao = Refeicao(nome: "Almoço", felicidade: "5")
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

if let primeiroItemDaLista = refeicao.itens.first {
    print(primeiroItemDaLista.nome)
}

print(refeicao.totalDeCalorias())
