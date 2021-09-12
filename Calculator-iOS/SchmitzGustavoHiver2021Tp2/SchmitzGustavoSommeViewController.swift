 /*
  *Cours: Programmation native mobile - iOS
  *Proffesseur: Mamadou Bella Diallo
  *Étudiant: Gustavo Schmitz
  *Date: 23/04/2021
  */

import UIKit

class SchmitzGustavoSommeViewController: UIViewController {
    
    //Déclaration des variables.
    var vNum1: Double = 0
    var vNum2: Double = 0
    var vOperateur: String = ""
    var vVerificateur = true
    var vDiv0: Bool = false
    
    //Vatiable à affichage le résultat à l'écran
    @IBOutlet weak var resultat: UILabel!
    
    //Constructeur insérant 0 dans l'écran.
    override func viewDidLoad() {
        super.viewDidLoad()
        resultat.text = String(0)
    }
    
    //Méthode de stockage des valeurs typées.
    @IBAction func boutons(_ sender: UIButton) {
        if(vVerificateur){
            resultat.text = String(sender.tag)
            vNum1 = Double(resultat.text!)!
            vVerificateur = false
        }
        else {
            resultat.text = resultat.text! + String(sender.tag)
            vNum1 = Double(resultat.text!)!
        }
    }
    
    //Méthode pour effacer les valeurs des variables.
    @IBAction func effacer(_ sender: UIButton) {
        vNum1 = 0
        vNum2 = 0
        vOperateur = ""
        vVerificateur = true
        resultat.text = String(0)
    }
    
    //Méthode qui effectue les calculs des opérations mathématiques.
    @IBAction func calculer(_ sender: UIButton) {
        if sender.tag != 10 && sender.tag != 17 && resultat.text != nil {
            if(vNum2 != 0){
                calc()
            }
            if(vDiv0){
                vDiv0 = false
            }else{
                vNum2 = Double(resultat.text!)!
                vNum1 = 0
                if sender.tag == 11 {
                    vOperateur = "+"
                    resultat.text = String(vNum2)
                }
                if sender.tag == 12 {
                    vOperateur = "-"
                    resultat.text = String(vNum2)
                }
                if sender.tag == 13 {
                    vOperateur = "x"
                    resultat.text = String(vNum2)
                }
                if sender.tag == 14 {
                    vOperateur = "/"
                    resultat.text = String(vNum2)
                }
                vVerificateur = true
            }
        }
        else if sender.tag == 10 {
            if vOperateur == "+" {
                resultat.text = String(vNum1 + vNum2)
                vOperateur = ""
            }
            else if vOperateur == "-" {
                resultat.text = String(vNum2 - vNum1)
                vOperateur = ""
            }
            else if vOperateur == "x" {
                resultat.text = String(vNum1 * vNum2)
                vOperateur = ""
            }
            else if vOperateur == "/" {
                if(vNum1 == 0){
                    resultat.text = "Error - Div par 0"
                    vNum1 = 0
                    vNum2 = 0
                    vOperateur = ""
                    vVerificateur = true
                }else{
                    resultat.text = String(vNum2 / vNum1)
                    vOperateur = ""
                }
            }
            vVerificateur = true
        }
        else if sender.tag == 17 {
            resultat.text = resultat.text! + "."
        }
    }
    
    //Méthode qui effectue des calculs pour les opérations en chaîne.
    func calc(){
        if vOperateur == "+" {
            resultat.text = String(vNum1 + vNum2)
            vOperateur = ""
        }
        else if vOperateur == "-" {
            resultat.text = String(vNum2 - vNum1)
            vOperateur = ""
        }
        else if vOperateur == "x" {
            resultat.text = String(vNum1 * vNum2)
            vOperateur = ""
        }
        else if vOperateur == "/" {
            if(vNum1 == 0){
                resultat.text = "Error - Div par 0"
                vNum1 = 0
                vNum2 = 0
                vOperateur = ""
                vVerificateur = true
                vDiv0 = true
            }else{
                resultat.text = String(vNum2 / vNum1)
                vOperateur = ""
            }
        }
    }
    
}
