//
//  QuizCerebro.swift
//  QUIZcfe
//
//  Created by marco rodriguez on 04/08/22.
//

import Foundation
import UIKit

struct QuizCerebro {
    //arreglo de preguntas
    let preguntas = [
        Pregunta(texto: "¿La capital de China es Beijin?", respuesta: "VERDADERO", color: UIColor.tintColor, image: UIImage(named: "1")!),
        Pregunta(texto: "El numero 9 es un numero primo", respuesta: "VERDADERO", color: UIColor.red, image: UIImage(named: "2")!),
        Pregunta(texto: "La raiz cuadrada de 81 es 8", respuesta: "FALSO", color: UIColor.orange, image: UIImage(named: "3")!)
    ]
    
    
    var numPregunta = 0
    var puntuacion = 0
    
    mutating func revisarRespuesta(respuestaUsuario: String) -> Bool {
        if respuestaUsuario == preguntas[numPregunta].respuesta {
            
            puntuacion = puntuacion + 1
            print("Puntuacion es: \(puntuacion)")
            
            return true
        } else {
            return false
        }
    }
    
    func obtenerPuntuacion() -> Int {
        return puntuacion
    }
    
    func obtenerTextoPregunta() -> String {
        return preguntas[numPregunta].texto
    }
    
    func obtenerProgreso() -> Float {
        //String(), Int(), Double()
        let progreso = Float(numPregunta + 1) / Float(preguntas.count)
        return progreso
    }
    
    func obtenerColor() -> UIColor {
        let color = preguntas[numPregunta].color
        return color
    }
    
    func obtenerImagen() -> UIImage {
        let imagen = preguntas[numPregunta].image
        return imagen
    }
    
    mutating func siguientePregunta() -> Bool {
        if numPregunta + 1 < preguntas.count {
            numPregunta = numPregunta + 1
            print("El num de pregunta es: \(numPregunta)")
            return false
        } else {
            numPregunta = 0
            return true
        }
    }
    
}
