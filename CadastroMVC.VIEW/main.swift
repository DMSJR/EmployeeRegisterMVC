//
//  main.swift
//  CadastroMVC
//
//  Created by user on 26/06/23.
//

import Foundation
let cadastroSTR: CadastroDTO.Employee = CadastroDTO.Employee(name: "", office: "", salary: 0)
var cadastroDTO = CadastroDTO(employee: cadastroSTR)
var cadastroCTR = CadastroCTR(cadastroDTO: cadastroDTO)


func getStr(_ str:String) -> String{
    print(str)
    if let  inputStr = readLine(){
        
        return inputStr
        
    }else{
        
        print ("Informação inválida❌")
        return getStr(str)
    }
}
func getDouble(_ str:String) -> Double{
    print (str)
    if let inputDouble = readLine(), let numberDouble = Double(inputDouble) {
        return (numberDouble)
    }
    else
    {
        print ("Informação inválida❌")
        return getDouble(str)
    }
}

func getInteger(_ str:String) ->Int{
    print (str)
    if let inputInt = readLine(), let numberInt = Int(inputInt) {
        return (numberInt)
    }
    else
    {
        print ("Informação inválida❌")
        return getInteger(str)
    }
}

func registerEmployee(){
    let employee: CadastroDTO.Employee = CadastroDTO.Employee(name: getStr("Nome do funcionário: "), office: getStr("Cargo:"), salary: getDouble("Salário: "))

    cadastroDTO.setEmployee(employee: employee)
    print(cadastroCTR.addJSON(cadastroDTO: cadastroDTO))
}

func searchAndDelete(name : String){
    var displayIndex = 0
    
    var toDeleteArray: [(index: Int, employeeName: String)] = []
    let employees = cadastroCTR.list()
    
    for employee in employees{
        
        if employee.getEmployee().name.uppercased().hasPrefix(name.uppercased()){
            
            displayIndex += 1
            print ("\(displayIndex) - \(employee.getEmployee().name)")
            
            toDeleteArray.append((index: displayIndex, employeeName: employee.getEmployee().name))
        }
        
    }
    let toDelete = getInteger ("Digite o numero para deletar")
    var deleted = false
    for employee in toDeleteArray {
        
        if employee.index == toDelete {
            let toDeleteStruct : CadastroDTO.Employee = CadastroDTO.Employee(name: employee.employeeName, office: "", salary: 0)
            
            let cadastroDTOToDelete = CadastroDTO(employee: toDeleteStruct)
            let cadastroCTRtoDelete = CadastroCTR(cadastroDTO: cadastroDTOToDelete)
            print(cadastroCTRtoDelete.deleteEmployee(cadastroDTO: cadastroDTOToDelete))
            deleted = true
        }
    }
    if deleted == false{
        print ("Valor inválido❌")
    }
    return
}

func menu(){
    var option = 0
    while(option != 4){
        option = getInteger(
"""
Menu de opções:
1 - Cadastrar funcionário  💾
2 - Deletar funcionário  ☠️
3 - Listar funcionários  📜
4 - Sair ☕️
"""
        )
        
        
        switch (option){
        case 1: registerEmployee()
                
        case 2: searchAndDelete(name: getStr("Digite o nome para busca"))
                
        case 3:
            let cadastroDTO2 = cadastroCTR.list()
            if (cadastroDTO2.isEmpty){
                print ("Nenhum cadastro encontrado ❌")}
                for employee in cadastroDTO2{
                    print("""
nome: \(employee.getEmployee().name)
cargo: \(employee.getEmployee().office)
salário: \(employee.getEmployee().salary)

"""
                )
                }
        case 4:
            print ("Obrigdo por usar o sistema☕️")
        default: print("opcão inválida❌")
        }
        
    }
}

menu()
