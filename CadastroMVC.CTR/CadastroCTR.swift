//
//  CadastroCTR.swift
//  CadastroMVC
//
//  Created by user on 26/06/23.
//

import Foundation
public class CadastroCTR{
    
    var cadastroDAO = CadastroDAO()
    var cadastroDTO: CadastroDTO
    init(cadastroDTO: CadastroDTO) {
        self.cadastroDTO = cadastroDTO
    }
    
    public func addJSON(cadastroDTO: CadastroDTO)-> String{
        return cadastroDAO.addJSON(cadastroDTO: self.cadastroDTO )
    }
    
    public func deleteEmployee(cadastroDTO: CadastroDTO) -> String{
        return cadastroDAO.deleteEmployee(cadastroDTO: self.cadastroDTO )
    }
    
    public func list ()->[CadastroDTO]{
        return  cadastroDAO.read()
    }
}
        
