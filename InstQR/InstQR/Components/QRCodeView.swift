//
//  ImageContainer.swift
//  InstQR
//
//  Created by Daniel Freitas on 14/04/2025.
//

import SwiftUI
import SwiftData
import CoreImage.CIFilterBuiltins

typealias UIImage = NSImage

struct QRCodeView: View {
    let url: String
    
    func generateQRCode(from string: String, size: CGFloat = 300) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        
        filter.setValue(data, forKey: "inputMessage")
        filter.correctionLevel = "Q"
        
        if let outputImage = filter.outputImage {
            let scaledImage = outputImage.transformed(by: CGAffineTransform(scaleX: size / outputImage.extent.size.width,
                                                                             y: size / outputImage.extent.size.height))
            if let cgimg = context.createCGImage(scaledImage, from: scaledImage.extent) {
                return UIImage(cgImage: cgimg,size: NSSize(width: 200, height: 200))
            }
        }
        return nil
    }

    var body: some View {
        HStack {
            VStack {
                if (url.isEmpty) {
                    HStack {
                        VStack {
                            Text("Enter your text")
                                .italic()
                                .foregroundStyle(Color.PlaceholderText)
                        }
                    }
                } else {
                    if let uiImage = generateQRCode(from: url, size: 300) {
                        VStack {
                            Image(nsImage: uiImage)
                                .interpolation(.none)
                                .resizable()
                                .frame(width: 250, height: 250)
                        }

                    } else {
                        Text("Failed to generate QR Code")
                    }
                }
            }
        }.padding(16).frame(minWidth: 300, minHeight: 300)
        
    }
}


#Preview {
    QRCodeView(url: "Test")
}

