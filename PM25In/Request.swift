//
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public class Request {
    var tokenRequired: Bool {
        get {
            return true
        }
    }
    
    var uniqueURLString: String {
        get {
            return String()
        }
    }
    
    var parametersString: String {
        get {
            return String()
        }
    }
    
    let timestamp: NSTimeInterval
    
    public init() {
        timestamp = NSDate().timeIntervalSince1970
    }
    
    deinit {
        if PM25In.debugEnabled {
            print("PM25In --- deinit request(\(self.description()))")
        }
    }
    
    private func responseObject() -> Response {
        return Response()
    }
    
    func parse(data: NSData) throws -> Response {
        let response = self.responseObject()
        
        try response.fromJsonData(data)
        
        return response
    }
    
    func description() -> String {
        return "\(self.uniqueURLString) | \(self.parametersString) | \(self.timestamp)"
    }
}

public class AQIRequest: Request {
    private let city: String
    private let avg: Bool
    private let stations: Bool
    
    public init(city: String, avg: Bool = true, stations: Bool = true) {
        self.city = city
        self.avg = avg
        self.stations = stations
        
        super.init()
    }
    
    override var uniqueURLString: String {
        get {
            return "/only_aqi.json"
        }
    }
    
    override var parametersString: String {
        get {
            var parameters = "city=\(self.city)"
            if self.avg != true {
                parameters += "&avg=false"
            }
            if self.stations != true {
                parameters += "&stations=no"
            }
            
            return parameters
        }
    }
    
    private override func responseObject() -> Response {
        return AQIResponse()
    }
}

public class PM25Request: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/pm2_5.json"
        }
    }
    
    private override func responseObject() -> Response {
        return PM25Response()
    }
}

public class PM10Request: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/pm10.json"
        }
    }
    
    private override func responseObject() -> Response {
        return PM10Response()
    }
}

public class CORequest: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/co.json"
        }
    }
    
    private override func responseObject() -> Response {
        return COResponse()
    }
}

public class NO2Request: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/no2.json"
        }
    }
    
    private override func responseObject() -> Response {
        return NO2Response()
    }
}

public class SO2Request: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/so2.json"
        }
    }
    
    private override func responseObject() -> Response {
        return SO2Response()
    }
}

public class O3Request: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/o3.json"
        }
    }
    
    private override func responseObject() -> Response {
        return O3Response()
    }
}

public class AQIDetailedRequest: AQIRequest {
    override var uniqueURLString: String {
        get {
            return "/aqi_details.json"
        }
    }
    
    private override func responseObject() -> Response {
        return AQIDetailedResponse()
    }
}

public class AQIByStationRequest: Request {
    private let stationCode: String
    
    public init(stationCode: String) {
        self.stationCode = stationCode
        
        super.init()
    }
    
    override var uniqueURLString: String {
        get {
            return "/aqis_by_station.json"
        }
    }
    
    override var parametersString: String {
        get {
            return "station_code=\(self.stationCode)"
        }
    }
    
    private override func responseObject() -> Response {
        return AQIDetailedResponse()
    }
}

public class StationNamesRequest: Request {
    private let city: String
    
    public init(city: String) {
        self.city = city
        
        super.init()
    }
    
    override var uniqueURLString: String {
        get {
            return "/station_names.json"
        }
    }
    
    override var parametersString: String {
        get {
            return "city=\(self.city)"
        }
    }
    
    private override func responseObject() -> Response {
        return StationNamesResponse()
    }
}

public class CitiesRequest: Request {
    override var uniqueURLString: String {
        get {
            return ".json"
        }
    }
    
    override var parametersString: String {
        get {
            return String() // no parameters
        }
    }
    
    private override func responseObject() -> Response {
        return CitiesResponse()
    }
}

public class AllCitiesAQIRequest: Request {
    override var uniqueURLString: String {
        get {
            return "/all_cities.json"
        }
    }
    
    override var parametersString: String {
        get {
            return String() // no parameters
        }
    }
    
    private override func responseObject() -> Response {
        return AQIDetailedResponse()
    }
}

public class AQIRankingRequest: Request {
    override var uniqueURLString: String {
        get {
            return "/aqi_ranking.json"
        }
    }
    
    override var parametersString: String {
        get {
            return String() // no parameters
        }
    }
    
    private override func responseObject() -> Response {
        return AQIRankingResponse()
    }
}