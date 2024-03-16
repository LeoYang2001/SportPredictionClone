//
//  LeagueFilter.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import Foundation

enum LeagueFilter: Int, CaseIterable, Identifiable{
    case nba
    case nfl
    case ncaa
    case ncaafootball
    
    var title: String{
        switch self{
            case .nba: return "NBA"
            case .nfl: return "NFL"
            case .ncaa: return "NCAA"
            case .ncaafootball: return "NCAA Football"
        }
    }
    
    var id: Int {return self.rawValue}
}
