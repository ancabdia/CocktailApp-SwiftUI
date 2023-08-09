//
//  SettingsComponents.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct SettingsComponents: View {
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    var body: some View {
        GroupBox(label: Text("Settings")) {
            Toggle(isOn: $isDarkModeOn) {
                Text("Switch to dark Mode")
            }
            //Mock to change language
            HStack{
                Label("Select Language", systemImage: "character.bubble.fill")
                Spacer()
                Picker(selection: .constant(0), label: Text("Select Language")) {
                    Text("English").tag(1)
                    Text("Español").tag(2)
                }
            }
        }
    }
}

struct SettingsComponents_Previews: PreviewProvider {
    static var previews: some View {
        SettingsComponents()
    }
}
