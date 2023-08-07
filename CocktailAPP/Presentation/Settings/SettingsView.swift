//
//  SettingsView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    var body: some View {
        VStack {
            Section {
                Toggle(isOn: $isDarkModeOn) {
                    Text("Switch to dark Mode")
                }
            }
            Divider()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
