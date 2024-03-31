//
//  LeagueFilter.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import Foundation

enum LeaderBoardFilter: Int, CaseIterable, Identifiable{
    case alltime
    case lastWeek
    case lastMonth

    
    var title: String{
        switch self{
            case .alltime: return "All-time"
            case .lastWeek: return "Last 2 weeks"
            case .lastMonth: return "Last Month"
        }
    }
    
    var id: Int {return self.rawValue}
}
