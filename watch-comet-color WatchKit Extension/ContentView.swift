import SwiftUI

struct ContentView: View {
    @State var bgColor: Color?
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    Button("Red") {
                        print("changed to red")
                        bgColor = .red
                    }
                    Button("Grn") {
                        print("changed to green")
                        bgColor = .green
                    }
                    Button("Clr") {
                        print("cleared")
                        bgColor = nil
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .if(bgColor != nil) { view in
                view.background(bgColor)
            }
            .if(bgColor == nil) { view in
                view.background(Image("Comet").resizable())
            }
            //.border(.red, width: 2)
            .ignoresSafeArea(.all) // uses area at bottom, but not top
            .navigationTitle("Background Color")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// See https://www.avanderlee.com/swiftui/conditional-view-modifier/.
extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: condition to evaluate
    ///   - transform: transform to apply to source `View`
    /// - Returns: modified or original `View`
    @ViewBuilder func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
