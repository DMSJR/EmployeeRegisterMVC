//
//  CadastroDTO.swift
//  CadastroMVC
//
//  Created by user on 26/06/23.
//

import Foundation

public class CadastroDTO: Codable{
    struct Employee: Codable{
        var name: String
        var office: String
        var salary: Double
        
        
        init(name: String, office: String, salary: Double) {
            self.name = name
            self.office = office
            self.salary = salary
        }
    }
    var employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func getEmployee ()-> Employee{
        return self.employee
        
    }
    func setEmployee (employee: Employee){
        self.employee = employee
    }
    
}
