import SwiftUI

// Extension creada para mostrar los errores como alert en pantalla.
// Con esto podemos utilizar directamente el error custom para lanzar el alert desde la view, sin necesidad de tener que utilizar una variable boolean mas, para mostrar el isPresented del alert por defecto.
extension View {
    func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}
