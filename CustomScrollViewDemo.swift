struct CustomScrollViewDemo: View {
    @State private var translation: CGPoint = .zero

    private let rectWidth = 200.0
    private let rectHeight = 200.0
    private let scaleEffect = 5.0

    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.yellow, .green, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: rectWidth, height: rectHeight)
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                .scaleEffect(scaleEffect)
                .offset(x: translation.x, y: translation.y)
                .onAppear {
                    NSEvent.addLocalMonitorForEvents(
                        matching: .scrollWheel,
                        handler: { event in
                            self.translation = .init(
                                x: self.translation.x + event.scrollingDeltaX,
                                y: self.translation.y + event.scrollingDeltaY
                            )
                            return nil
                        }
                    )
                }
        }
    }
}
