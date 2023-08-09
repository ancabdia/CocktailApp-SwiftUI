//
//  CellTitleComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct CellTitleComponent: View {
    
    var name: String
    var instructions: String
    
    init(name: String, instructions: String) {
        self.name = name
        self.instructions = instructions
    }
    
    var body: some View {
        Text(name)
            .fontWeight(.semibold)
            .font(.system(size: 14))
        Text(instructions)
            .font(.system(size: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(3)
    }
}

struct CellTitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        CellTitleComponent(name: "Sex on the Beach", instructions: "Pull all ingredients on the shaker")
    }
}
