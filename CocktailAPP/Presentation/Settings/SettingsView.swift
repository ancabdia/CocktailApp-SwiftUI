//
//  SettingsView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI
struct SettingsView: View {
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    
    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
    }
    
    var body: some View {
        VStack {
            Section{
                NavigationStack{
                    List(settingsViewModel.favCocktails){ cocktail in
                        NavigationLink{
                            CocktailDetailView(cocktail: cocktail)
                        } label: {
                            CocktailCellView(cocktail: cocktail)
                        }
                    }.navigationBarTitle(Text("Favourite Cocktails"))
                        .refreshable {
                            settingsViewModel.getFavCocktail()
                        }
                }
            }
            Section {
                Toggle(isOn: $isDarkModeOn) {
                    Text("Switch to dark Mode")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsViewModel: SettingsViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
