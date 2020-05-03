//
//  AddPresupuestoViewController.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/26/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

protocol AddBudgetViewControllerProtocol: class {
    func addBudget(budget: Budget)
    func modifyBudget (budget: Budget, name:String)
}

class AddBudgetViewController: UITableViewController, UITextFieldDelegate {

    var budget: Budget?
    var isEdit = false
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var periodTextField: UITextField!
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    let periodicityPickerView = UIPickerView()
    let startDatePickerView = UIDatePicker()
    
    weak var delegate: AddBudgetViewControllerProtocol?
    
    var periodicityList = ["Weekly", "Bi-Weekly", "Montly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDateTextField.text = Date().getFormatted(dateStyle: .short, timeStyle: .none)

        amountTextField.keyboardType = .numberPad

        setBudget()
        addProductNavigationButton ()
        dismissPickerView()
    }
    
    func setBudget() {
        if let budget = self.budget {
            isEdit = true
            
            nameTextField.text = budget.name
            periodTextField.text = budget.periodicity
            startDateTextField.text = budget.startDate.getFormatted(dateStyle: .short, timeStyle: .none)
            amountTextField.text = String(format:"%.1f",budget.amount)
                   
            periodTextField.isEnabled = false
            startDateTextField.isEnabled = false
            amountTextField.isEnabled = false
            
            periodTextField.backgroundColor = .lightGray
            startDateTextField.backgroundColor = .lightGray
            amountTextField.backgroundColor = .lightGray
        }
        
        //periodTextField.delegate = self
        periodicityPickerView.delegate = self
        startDateTextField.delegate = self
        periodTextField.inputView = periodicityPickerView
        startDateTextField.inputView = startDatePickerView
        amountTextField.keyboardType = .numberPad
    }
    
    //Este método va a crear un boton en la parte superior derecha para que el usuario pueda cerrar el teclado
        func dismissPickerView() {
            //Es importante inicializar el tamaño del toolbar para evitar warnings de constraints en la terminal
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
            toolBar.sizeToFit()
            //El flexbutton es un espaciador que me va a permitir tener el boton done a la derecha y no a la izquierda, si lo deseara a la izquierda solo deberia eliminar este espaciador
            let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([flexButton,button], animated: true)
            toolBar.isUserInteractionEnabled = true
    //        le asigno el toolbar a ambos textfields
            periodTextField.inputAccessoryView = toolBar
            startDateTextField.inputAccessoryView = toolBar
        }
        
        //Esta es la action que se va a ejecturar cuando el usuario presione el boton done creado en el método dismissPickerView()
        //Por default al cerrarse el picker y no hacer interacción con el haciendo scroll, no tenemos forma de que los delegados se llamen por lo tanto no podemos obtener la selección, por lo tanto en este método pregunto cual es el textfield que se esta editando para asi saber que valor ponerle al mismo
        @objc func action() {
            if periodTextField.isEditing {
                periodTextField.text = periodicityList[periodicityPickerView.selectedRow(inComponent: 0)]
            } else {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                startDateTextField.text = formatter.string(from: startDatePickerView.date)
            }
            view.endEditing(true)
        }
    
    func addProductNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBudgetAction(sender:)))
        
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func saveBudgetAction (sender:UIBarButtonItem) {
        if let name = nameTextField.text, amountTextField.text!.count > 0, name.count > 0 {
            //Convert Date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            let date = dateFormatter.date(from:startDateTextField.text!)!
            
            //Convert amount
            let amount = Double (amountTextField.text!)!
            
            let budget = Budget (name: nameTextField.text!, periodicity:periodTextField.text!, startDate: date, initialAmount:amount, amount: amount)
            
            if isEdit {
                delegate?.modifyBudget(budget: self.budget!, name: name)
            } else {
                delegate?.addBudget(budget: budget)
            }
        } else {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        
    }
        
}

extension AddBudgetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //un mismo picker puede tener varios componentes, en este caso solo ocupamos uno, esto es similar a las secciones de una tabla
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //este método se encarga de saber cuantas rows tiene un picker, recibimos un pickerView como parámetro esto nos permite identificar a cual picker se refiere por eso es que hago un if con las propiedades de los picker definidas anteriormente
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         if pickerView == periodicityPickerView {
            return periodicityList.count
        }
         else { return 0 }
    }
    //Este método se encarga de hacer el pintado de la información
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == periodicityPickerView {
            return periodicityList[row]
        } else {
            return periodicityList[row]
        }
        
    }
    
//    Este método detecta la selección y la setea en el textfield respectivo
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        periodTextField.text = periodicityList[row]
        
        
        let color = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1)
    }
}

