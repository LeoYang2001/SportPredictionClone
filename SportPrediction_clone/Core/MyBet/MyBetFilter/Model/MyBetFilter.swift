//
//  LeagueFilter.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import Foundation

enum MyBetFilter: Int, CaseIterable, Identifiable{
    case all
    case open
    case settiled
    case won
    case lost

    
    var title: String{
        switch self{
            case .all: return "All"
            case .open: return "Open"
            case .settiled: return "Settled"
            case .won: return "Won"
            case .lost: return "Lost"
        }
    }
    
    var id: Int {return self.rawValue}
}
