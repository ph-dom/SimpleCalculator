//
//  ButtonText.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 07-05-22.
//

import SwiftUI

struct ButtonText: View {
    var title: String = "+";
    var color: Color = Color.gray;
    
    var body: some View {
        Text(self.title)
            .font(Font.custom("Helvetica", size: 40))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(
                Rectangle()
                    .fill(self.color)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
    }
}

struct ButtonText_Previews: PreviewProvider {
    static var previews: some View {
        ButtonText()
    }
}
