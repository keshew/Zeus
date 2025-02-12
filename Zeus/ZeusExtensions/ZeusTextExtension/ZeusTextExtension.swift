import SwiftUI

extension Text {
    func Yeast(size: CGFloat,
                color: Color = .white,
                    outlineWidth: CGFloat = 1,
               colorOutline: Color = .black) -> some View {
        self.font(.custom("Yeast22-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
    func SkrampCyr(size: CGFloat,
                color: Color = .white,
                    outlineWidth: CGFloat = 1,
               colorOutline: Color = .black) -> some View {
        self.font(.custom("SkrampCyr", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
    func YestGradient(size: CGFloat, colors: [Color], outlineWidth: CGFloat = 0.5, colorOutline: Color = .white) -> some View {
        self.font(.custom("Yeast22-Regular", size: size))
            .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: colors),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

