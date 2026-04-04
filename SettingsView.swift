import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    
    @AppStorage("pngQuality") private var pngQuality: Double = 80.0
    @AppStorage("webpQuality") private var webpQuality: Double = 80.0
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with Back Button
            HStack {
                Button(action: { showSettings = false }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 12, weight: .bold))
                        Text("Back")
                    }
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
                
                Spacer()
                Text("Quality Settings")
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .background(Color(white: 0.05))
            
            // Sliders
            VStack(spacing: 12) {
                VStack(spacing: 2) {
                    HStack {
                        Text("PNG Quality")
                        Spacer()
                        Text("\(Int(pngQuality))")
                    }
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    
                    Slider(value: $pngQuality, in: 40...100, step: 1)
                        .tint(.white)
                }
                
                VStack(spacing: 2) {
                    HStack {
                        Text("WebP Quality")
                        Spacer()
                        Text("\(Int(webpQuality))")
                    }
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    
                    Slider(value: $webpQuality, in: 40...100, step: 1)
                        .tint(.white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer(minLength: 0)
        }
        .frame(width: 340, height: 180)
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}
