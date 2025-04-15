import SwiftUI

struct InputView: View {
    @State private var inputValue: String = ""
    @FocusState private var isFocused: Bool
        
    private var onConclude: ((String) -> Void)?
    
    init(_ onConclude: ((String) -> Void)?) {
        self.onConclude = onConclude
    }
        
    var body: some View {
        HStack {
            TextField("Insert your text...", text: $inputValue, axis: .vertical)
                .background(Color.InputBackground)
                .border(Color.clear)
                .focused($isFocused)
                .frame(minHeight: 30)
            Spacer().frame(width: 12)
            Button(action: {
                self.onConclude?(self.inputValue)
                self.inputValue = ""
            }) {
                Text("Generate")
            }
            .background(Color.ButtonBackground)
            .font(.footnote)
            .fontWeight(.bold)
            .buttonStyle(.bordered)
            .cornerRadius(6)
        
        }.frame(minWidth: 100,
                maxWidth: 400,
                minHeight: 48,
                alignment: .leading)
        .padding(.vertical, 4)
        .padding(.leading, 8)
        .padding(.trailing, 8)

        
    }
}

#Preview {
    InputView({_ in})
}
