//
//  RoundedButtonView.swift
//  This is a custom rounded rectangle button
//
//  Created by DOMINIC NDONDO on 9/22/23.
//
import SwiftUI


///Custom RoundedButtonView
public struct RoundedButtonView: View {
    @State public var text: String
    @State public var image: String
    @State public var width: CGFloat
    @State public var height: CGFloat
    @State public var cornerRadius: CGFloat
    @State public var foregroundColor: Color
    @State public var imageColor: Color
    @State public var textColor: Color
    
    public init(text: String = "", image: String = "hand.tap", width: CGFloat = 120, height: CGFloat = 60, cornerRadius: CGFloat = 10, foregroundColor: Color = .green, imageColor: Color = .blue, textColor: Color = .black) {
        self.text = text
        self.image = image
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.imageColor = imageColor
        self.textColor = textColor
    }
    
    public var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: self.width, height: self.height)
                .foregroundColor(self.foregroundColor)
                
            VStack {
                
                Image(systemName: self.image)
                    .foregroundColor(self.imageColor)
                    .padding(2)
                    
                Text(self.text)
                    .foregroundColor(self.textColor)
                    .padding(2)
            }
            
            
        }
    }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        RoundedButtonView(text: "connect", image: "dot.radiowaves.left.and.right", width: 120, height: 60, cornerRadius: 10, foregroundColor: .mint, imageColor: .accentColor, textColor: .black)
    }
}
