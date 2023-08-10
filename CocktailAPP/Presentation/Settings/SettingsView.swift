//
//  SettingsView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI
struct SettingsView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    
    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
    }
    
    var body: some View {
        VStack {
            FavoriteListComponent(settingsViewModel: settingsViewModel)
            Divider()
            SettingsComponents()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsViewModel: SettingsViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
