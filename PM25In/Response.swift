//
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public class Response {
    func fromJsonData(data: NSData) throws {
        // Check error
        if let errorInfo = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String: AnyObject] {
            if errorInfo["error"] != nil {
                throw PM25InError.APIRejectedError(info: errorInfo["error"] as! String)
            }
        }
    }
}

public class AQIResponse: Response {
    public var aqiArray: [AQI]?
    
    override init() {
        self.aqiArray = nil
    }
    
    override func fromJsonData(data: NSData) throws {
        try super.fromJsonData(data)
        
        if let aqiItems = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [[String: AnyObject]] {
            var tmp = [AQI]()
            for aqiItem in aqiItems {
                tmp.append(self.buildAQI(aqiItem))
            }
            self.aqiArray = tmp
        }
    }
    
    private func buildAQI(data: [String: AnyObject]) -> AQI {
        return AQI(response: data)
    }
}

public class PM25Response: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return PM25(response: data)
    }
}

public class PM10Response: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return PM10(response: data)
    }
}

public class COResponse: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return CO(response: data)
    }
}

public class NO2Response: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return NO2(response: data)
    }
}

public class SO2Response: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return SO2(response: data)
    }
}

public class O3Response: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return O3(response: data)
    }
}

public class AQIDetailedResponse: AQIResponse {
    override func buildAQI(data: [String: AnyObject]) -> AQI {
        return AQIDetailed(response: data)
    }
}

public class AQIRankingResponse: AQIResponse {
    override func buildAQI(data: [String : AnyObject]) -> AQI {
        return AQIRanking(response: data)
    }
}

public class Station {
    public let station_name: String?
    public let station_code: String?
    
    init(response data: [String: AnyObject]) {
        self.station_name = data["station_name"] as? String
        self.station_code = data["station_code"] as? String
    }
}

public class StationNamesResponse: Response {
    public var city: String?
    public var stations: [Station]?
    
    override init() {
        self.city = nil
        self.stations = nil
    }
    
    override func fromJsonData(data: NSData) throws {
        try super.fromJsonData(data)
        
        if let data = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String: AnyObject] {
            self.city = data["city"] as? String
            
            if let stations = data["stations"] as? [[String: AnyObject]] {
                var tmp = [Station]()
                for station in stations {
                    tmp.append(Station(response: station))
                }
                self.stations = tmp
            }
        }
    }
}

public class CitiesResponse: Response {
    public var cities: [String]?
    
    override init() {
        self.cities = nil
    }
    
    override func fromJsonData(data: NSData) throws {
        try super.fromJsonData(data)
        
        if let data = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String: AnyObject] {
            if let cities = data["cities"] as? [String] {
                self.cities = cities
            }
        }
    }
}