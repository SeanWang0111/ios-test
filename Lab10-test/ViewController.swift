//
//  ViewController.swift
//  Lab10-test
//
//  Created by Sean Wang on 2021/2/11.
//

import UIKit
import MapKit

class ViewController: UIViewController
{
    @IBOutlet var mapView: MKMapView!
    static var location:CLLocationManager? = nil
    var pointArr = [[25.043775,121.560642],[25.047945,121.516941],[25.019982,121.545314],[25.058198,121.542477],[25.026799,121.522885],[25.043775,121.560642]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMyLocation(_ sender: Any)
    {
        if(ViewController.location == nil)
        {
            ViewController.location = CLLocationManager()
            ViewController.location?.requestWhenInUseAuthorization()
            ViewController.location?.startUpdatingLocation()
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let center = mapView.userLocation.coordinate
        let region = MKCoordinateRegion(center:center,span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func addAnnotation(_ sender: Any)
    {
        mapView.removeOverlays(mapView.overlays)
        let annotation = MKPointAnnotation()
        let latLng = CLLocationCoordinate2DMake(25.042331, 121.535486)
        annotation.coordinate = latLng
        annotation.title = "臺北科技大學"
        annotation.subtitle = "台北市忠孝東路三段1號"
        mapView.addAnnotation(annotation)
        mapView.setCenter(annotation.coordinate, animated: true)
    }
    
    @IBAction func addPolyline(_ sender: Any)
    {
        mapView.removeAnnotations(mapView.annotations)
        var linePoints = [CLLocationCoordinate2D]()
        for point in pointArr
        {
            linePoints.append(CLLocationCoordinate2DMake(point[0], point[1]))
        }
        let line = MKPolyline(coordinates: linePoints, count: pointArr.count)
        mapView.addOverlay(line)
        mapView.setCenter(line.coordinate, animated: true)
    }
    
}

extension ViewController:MKMapViewDelegate
{
    func mapView(_ mapView:MKMapView,rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        if (overlay.isKind(of: MKPolyline.self))
        {
            let lineView = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            lineView.strokeColor = UIColor.red
            lineView.lineWidth = 10
            return lineView as MKOverlayRenderer
        }
        return MKOverlayRenderer()
    }
}
