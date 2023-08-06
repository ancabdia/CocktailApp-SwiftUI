//
//  Root.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}

final class RootViewModel: ObservableObject {
    
    // MARK: - Properties
    let repository: RepositoryProtocol
    @Published var status = Status.none
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func onSplash() {
    // Set status to loading
        status = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.status = .loaded
        }
    
        self.status = .loading
    }
}
