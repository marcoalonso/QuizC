//
//  QuizViewController.swift
//  QUIZcfe
//
//  Created by marco rodriguez on 04/08/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var imagenPregunta: UIImageView!
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var preguntaLabel: UILabel!
    @IBOutlet weak var falsoButton: UIButton!
    @IBOutlet weak var verdaderoButon: UIButton!
    @IBOutlet weak var barraProgrso: UIProgressView!
    
    // MARK: - Quiz
    var quizCerebro = QuizCerebro()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barraProgrso.progress = quizCerebro.obtenerProgreso()
        imagenPregunta.layer.cornerRadius = 20
        imagenPregunta.layer.masksToBounds = true

        preguntaLabel.text = quizCerebro.obtenerTextoPregunta()
        preguntaLabel.textColor = quizCerebro.obtenerColor()
        
        //imagen
        imagenPregunta.image = quizCerebro.obtenerImagen()
    }
    
    @IBAction func respuestaUserBtn(_ sender: UIButton) {
        //cual btn selecciono
        let respuestaUser = sender.titleLabel?.text ?? "VERDADERO"
        
        //true o false
        let respuestaCorrecta = quizCerebro.revisarRespuesta(respuestaUsuario: respuestaUser)
        
        if respuestaCorrecta {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
        //validar si hay mas preguntas
        if quizCerebro.siguientePregunta() {
            // ya no hay mas preguntas
            let alerta = UIAlertController(title: "Fin del Quizz, tu puntaje es: \(quizCerebro.obtenerPuntuacion())", message: "¿Quieres volver a jugar?", preferredStyle: .alert)
            
            let accionNo = UIAlertAction(title: "NO", style: .destructive) { _ in
                exit(0)//cierra la app
            }
            let accionAceptar = UIAlertAction(title: "SI", style: .default)
            
            alerta.addAction(accionNo)
            alerta.addAction(accionAceptar)
            
            present(alerta, animated: true)
        }
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
        
    }
    
    @objc func cambiarPregunta(){
        //actualizar mi label
        preguntaLabel.text = quizCerebro.obtenerTextoPregunta()
        preguntaLabel.textColor = quizCerebro.obtenerColor()
        
        //imagen pregunta
        imagenPregunta.image = quizCerebro.obtenerImagen()
        
        //barra de progreso
        barraProgrso.progress = quizCerebro.obtenerProgreso()
        print("Progreso: ",quizCerebro.obtenerProgreso())
        
        //puntaje
        puntajeLabel.text = "Puntaje es: \(quizCerebro.obtenerPuntuacion()) pts."
        
        //reset el color
        verdaderoButon.backgroundColor = UIColor.white
        falsoButton.backgroundColor = UIColor.white
    }


}
