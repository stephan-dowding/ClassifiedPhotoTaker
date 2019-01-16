//
//  CameraViewController.swift
//  ClassifiedPhotoTaker
//
//  Created by Stephan Dowding on 16/01/2019.
//  Copyright © 2019 Stephan Dowding. All rights reserved.
//

import Cocoa
import AVFoundation

class CameraViewController: NSViewController {

    @IBOutlet var camera: NSView!
    
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        camera.layer = CALayer()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSession.Preset.low
        
        
        displayCameraPreview(captureDevice: findCamera())
        

    }
    
    func findCamera() -> AVCaptureDevice? {
        let devices = AVCaptureDevice.devices()
        // Find the FaceTime HD camera object
        for device in devices {
            print(device)
            
            // Camera object found and assign it to captureDevice
            if (device.hasMediaType(AVMediaType.video)) {
                print(device)
                return device
            }
        }
        return nil
    }
    
    func displayCameraPreview(captureDevice: AVCaptureDevice?) {
        if captureDevice != nil {
            
            do {
                
                try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice!))
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.frame = (self.camera.layer?.frame)!
                
                // Add previewLayer into custom view
                self.camera.layer?.addSublayer(previewLayer!)
                
                // Start camera
                captureSession.startRunning()
                
            } catch {
                print(AVCaptureSessionErrorKey.description)
            }
        }
    }
    
}
