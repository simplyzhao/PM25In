# PM25In
Swift framework for PM25.in

## How-to

### Integrate using CocoaPods
You can use [Cocoapods](http://cocoapods.org/) to install `PM25In`by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

source 'https://github.com/simplyzhao/ZLPodSpecs.git'

target 'YourApp' do
  pod 'PM25In', '~> 0.12.10'
end
```

### Demo Code
```swift
import PM25In

PM25In.debugEnabled = true

let request = AllCitiesAQIRequest()
PM25In.sharedInstance.sendRequest(request) {
  (response: Response?, error: NSError?) in
  if let specificResponse = response as? AQIDetailedResponse {
    for item in specificResponse.aqiArray! {
      if item is AQIDetailed {
        print("\(item.area) --- \(item.aqi)")
      }
    }
  }
}
```

