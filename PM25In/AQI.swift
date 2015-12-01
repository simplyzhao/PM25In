//
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public class AQI {
    public let aqi: Double?
    public let area: String?
    public let position_name: String?
    public let primary_pollutant: String?
    public let quality: String?
    public let station_code: String?
    public let time_point: String?
    
    init(response data: [String: AnyObject]) {
        self.aqi = data["aqi"] as? Double
        self.area = data["area"] as? String
        self.position_name = data["position_name"] as? String
        self.primary_pollutant = data["primary_pollutant"] as? String
        self.quality = data["quality"] as? String
        self.station_code = data["station_code"] as? String
        self.time_point = data["time_point"] as? String
    }
}

public class PM25: AQI {
    public let pm2_5: Double?
    public let pm2_5_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.pm2_5 = data["pm2_5"] as? Double
        self.pm2_5_24h = data["pm2_5_24h"] as? Double
        
        super.init(response: data)
    }
}

public class PM10: AQI {
    public let pm10: Double?
    public let pm10_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.pm10 = data["pm10"] as? Double
        self.pm10_24h = data["pm10_24h"] as? Double
        
        super.init(response: data)
    }
}

public class CO: AQI {
    public let co: Double?
    public let co_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.co = data["co"] as? Double
        self.co_24h = data["co_24h"] as? Double
        
        super.init(response: data)
    }
}

public class NO2: AQI {
    public let no2: Double?
    public let no2_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.no2 = data["no2"] as? Double
        self.no2_24h = data["no2_24h"] as? Double
        
        super.init(response: data)
    }
}

public class SO2: AQI {
    public let so2: Double?
    public let so2_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.so2 = data["so2"] as? Double
        self.so2_24h = data["so2_24h"] as? Double
        
        super.init(response: data)
    }
}

public class O3: AQI {
    public let o3: Double?
    public let o3_24h: Double?
    public let o3_8h: Double?
    public let o3_8h_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.o3 = data["o3"] as? Double
        self.o3_24h = data["o3_24h"] as? Double
        self.o3_8h = data["o3_8h"] as? Double
        self.o3_8h_24h = data["o3_8h_24h"] as? Double
        
        super.init(response: data)
    }
}

public class AQIDetailed: AQI {
    public let pm2_5: Double?
    public let pm2_5_24h: Double?
    public let pm10: Double?
    public let pm10_24h: Double?
    public let co: Double?
    public let co_24h: Double?
    public let no2: Double?
    public let no2_24h: Double?
    public let so2: Double?
    public let so2_24h: Double?
    public let o3: Double?
    public let o3_24h: Double?
    public let o3_8h: Double?
    public let o3_8h_24h: Double?
    
    override init(response data: [String: AnyObject]) {
        self.pm2_5 = data["pm2_5"] as? Double
        self.pm2_5_24h = data["pm2_5_24h"] as? Double
        self.pm10 = data["pm10"] as? Double
        self.pm10_24h = data["pm10_24h"] as? Double
        self.co = data["co"] as? Double
        self.co_24h = data["co_24h"] as? Double
        self.no2 = data["no2"] as? Double
        self.no2_24h = data["no2_24h"] as? Double
        self.so2 = data["so2"] as? Double
        self.so2_24h = data["so2_24h"] as? Double
        self.o3 = data["o3"] as? Double
        self.o3_24h = data["o3_24h"] as? Double
        self.o3_8h = data["o3_8h"] as? Double
        self.o3_8h_24h = data["o3_8h_24h"] as? Double

        super.init(response: data)
    }
}

public class AQIRanking: AQIDetailed {
    public let level: String?   // AQIRanking response only and it has no element named "position_name" and "station_code"
    
    override init(response data: [String : AnyObject]) {
        self.level = data["level"] as? String
        
        super.init(response: data)
    }
}