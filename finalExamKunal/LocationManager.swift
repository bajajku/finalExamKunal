

import Foundation
import MapKit
class LocationManager : NSObject , ObservableObject , CLLocationManagerDelegate{
    
    
    let manager = CLLocationManager()
    @Published var location : CLLocation = CLLocation()
    @Published var region : MKCoordinateRegion = MKCoordinateRegion()
    @Published var coordinate = CLLocationCoordinate2D()
    @Published var mkRoute : MKRoute?
    @Published var mapItems : [MKMapItem] = []
    
    @Published var steps : [String] = []
    override init() {
        super.init()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.4561, longitude: -79.7),
                                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // new location info
        
        guard let location = locations.last else{
            
            print("error")
            return
        }
        self.location = location
        self.region.center = location.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
        print("error \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
            
        case .authorizedAlways , .authorizedWhenInUse :
            print("authorized ")
            manager.startUpdatingLocation()
            break
        case .notDetermined :
            manager.requestWhenInUseAuthorization()
            
            print("not determined")
        case .restricted :
            print("resticted")
        default :
            print("default")
        }
    }
    
    
    func searchLocation(locaionName : String , region : MKCoordinateRegion ){
        
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = locaionName
        request.region = region
        
        let search = MKLocalSearch(request: request)
        
        search.start { response , error in
            
            guard let response = response else {
                
                print("error")
                return
            }
            print("mapItems count =\(response.mapItems.count)")
            self.mapItems = response.mapItems
        }
        
    }
    
    
    func calculateRoute( from start : CLLocationCoordinate2D , to end : CLLocationCoordinate2D){
        self.steps = []
        
        let startPlaceMark = MKPlacemark(coordinate: start)
        let endPlaceMark = MKPlacemark(coordinate: end)
        
        let request = MKDirections.Request()
        
        request.source = MKMapItem(placemark: startPlaceMark)
        request.destination = MKMapItem(placemark: endPlaceMark)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response , error in
            
            guard let response = response else {
                
                print(" direction not found")
                return
            }
            self.mkRoute =   response.routes.first
            
            if let route = response.routes.first {
                
                for step in  route.steps {
                    
                    print(step.instructions)
                    self.steps.append(step.instructions)
                }
            }
            
        }
    }
}
