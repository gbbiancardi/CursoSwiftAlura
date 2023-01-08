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

let totalDeCalorias = [50.5, 100]

/*
 Pode declarar como Array<Double> ou simplesmente [Double]
 Quando um método possui um retorno, é necessário indicar qual o retorno previsto utilizando -> (tipo de retorno esperado)
 */
func todasCalorias(totalDeCalorias: [Double]) -> Double {
    var total: Double = 0 // necessário declarar a variável de forma explícita neste caso
    
    for caloria in totalDeCalorias {
        total += caloria
    }
    
    return total
}

let total = todasCalorias(totalDeCalorias: [50.5, 100, 400])

print(total)
