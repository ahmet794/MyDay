//
//  ButtonFuntions.swift
//  MyDay
//
//  Created by Ahmet Cihan on 27/07/2022.
//

import Foundation

final class ButtonFunctions: ObservableObject {
    
    enum Action {
        case na
        case present
        case dismiss
    }
    
    @Published private(set) var action: Action = .na
    
    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }
    
    func dismiss() {
        self.action = .dismiss
    }
}

extension ButtonFunctions.Action {
    
    var isPresented: Bool { self == .present }
    
    
}
