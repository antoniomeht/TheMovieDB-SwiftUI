//
//  MovieDateFormatter.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import Foundation

class MovieDateFormatter: DateFormatter{
    
    func movieDateString(from date: String) -> String{
        self.dateFormat = "yyyy-mm-dd"
        if let movieDate = self.date(from: date){
            self.dateFormat = "yyyy"
            return self.string(from: movieDate)
        }
        return "Unknown date"
    }
    
    func durationString(time: Int?) -> String{
        guard let duration = time else{
            return "Unknown duration"
        }
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: TimeInterval(duration) * 60) ?? "Unknown duration"
    }
    
}
