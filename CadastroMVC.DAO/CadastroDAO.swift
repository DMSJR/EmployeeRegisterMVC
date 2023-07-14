//
//  CadastroDAO.swift
//  CadastroMVC
//
//  Created by user on 26/06/23.
//

import Foundation

public class CadastroDAO {
    func createJSON(_ cadastroDTO: [CadastroDTO]){
        
        let defaults = UserDefaults.standard
        let enconder = JSONEncoder()
        guard let data = try? enconder.encode(cadastroDTO) else {return}
        defaults.set(data , forKey:"employees")
        
    }
    func addJSON(cadastroDTO: CadastroDTO) -> String{
        var tempRead = read()
        
        for employee in tempRead {
            
            if (employee.getEmployee().name.uppercased() == cadastroDTO.getEmployee().name.uppercased()){
                    return "Erro: nome já cadastrado❌"
                    
                }
            }
            
        
        tempRead.append(cadastroDTO)
        
        createJSON (tempRead)
        return "Empregado cadastrado com sucesso✅"
        
    }
    func deleteEmployee (cadastroDTO: CadastroDTO )-> String{
        print (cadastroDTO.getEmployee())
        let employees = read()
        
        let temp = employees.filter {$0.getEmployee().name.uppercased() != cadastroDTO.getEmployee().name.uppercased()}
        
        createJSON (temp)
        return "Empregado deletado com sucesso✅"
    }
    func read()-> [CadastroDTO]{
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        guard let data = defaults.object (forKey:"employees") as? Data    else{
            
            return []
        }
        if let employees = try? decoder.decode([CadastroDTO].self, from: data){
            return employees
        }
        return []
    }

    

    
}
