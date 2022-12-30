import Combine
import Foundation

//Objeto creado para generar delay en el searchable de episodios y localizaciones y evitar llamadas de red en cada tecleo del nombre
class DebouncedState<T>: ObservableObject {
    
    @Published var currentValue: T
    @Published var debouncedValue: T
    private var subscription: AnyCancellable?

    init(initialValue: T, delay: Double = 0.5) {
        _currentValue = Published(initialValue: initialValue)
        _debouncedValue = Published(initialValue: initialValue)
        subscription = $currentValue
            .debounce(for: .seconds(delay), scheduler: DispatchQueue.main)
            .sink { [weak self] value in
                self?.debouncedValue = value
            }
    }
}
