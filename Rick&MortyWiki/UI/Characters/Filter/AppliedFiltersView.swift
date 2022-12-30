import SwiftUI

//Vista de filtros aplicados
struct AppliedFiltersView: View {
    @Binding var name: String
    @Binding var gender: String
    @Binding var status: String
    @Binding var refreshList: Bool
    
    var body: some View {
        HStack {
            Text("characterView_filters".localized())
            if name != "" {
                AppliedFilterItemView(value: $name, refreshList: $refreshList)
            }
            if gender != "" {
                AppliedFilterItemView(value: $gender, refreshList: $refreshList)
            }
            if status != "" {
                AppliedFilterItemView(value: $status, refreshList: $refreshList)
            }
            Spacer()
        }
    }
}

struct AppliedFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        AppliedFiltersView(name: .constant("Rick"), gender: .constant("Female"), status: .constant("Dead"), refreshList: .constant(false))
    }
}
