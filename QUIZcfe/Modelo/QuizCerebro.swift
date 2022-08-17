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
        Pregunta(texto: "El punto llamado NEMO es el punto más difícil de alcanzar de todo el planeta.", respuesta: "VERDADERO", color: UIColor.tintColor, image: UIImage(named: "1")!),
        Pregunta(texto: "Tokio siempre ha sido la capital de Japón", respuesta: "FALSO", color: UIColor.red, image: UIImage(named: "2")!),
        Pregunta(texto: "Los nativos americanos enterraban sus hachas cuando hacían las paces", respuesta: "VERDADERO", color: UIColor.orange, image: UIImage(named: "3")!),
        Pregunta(texto: "El aluminio fue una vez más valioso que el oro", respuesta: "VERDADERO", color: UIColor.tintColor, image: UIImage(named: "4")!),
        Pregunta(texto: "Bélgica ha sido independiente durante miles de años", respuesta: "FALSO", color: UIColor.red, image: UIImage(named: "belgica")!),
        Pregunta(texto: "Ningún papa ha muerto nunca violentamente", respuesta: "FALSO", color: UIColor.orange, image: UIImage(named: "papa")!),
        Pregunta(texto: "Una ciudad perdida yace bajo el mar Mediterráneo", respuesta: "VERDADERO", color: UIColor.orange, image: UIImage(named: "mar")!),
        Pregunta(texto: "El budismo fue fundado en Japón", respuesta: "FALSO", color: UIColor.orange, image: UIImage(named: "budismo")!)
        
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
