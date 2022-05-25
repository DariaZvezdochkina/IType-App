import Foundation

final class DetailedVacancyViewModel: ObservableObject {
  
  private let vacancyId: String
  @Published private(set) var detailedVacancy: DetailedVacancy? {
    didSet {
      guard let vacanciesDescription = detailedVacancy?.vacanciesDescription else { return }
      vacancyDescription = stripTags(html: vacanciesDescription)
    }
  }
  @Published private(set) var vacancyDescription: String?
  @Published var presentedError = false
  private let detailedVacancyFetchingService: DetailedVacancyFetchService
  
  init(vacancyId: String, detailedVacancyFetchingService: DetailedVacancyFetchService = DetailedVacancyFetchService()) {
    self.vacancyId = vacancyId
    self.detailedVacancyFetchingService = detailedVacancyFetchingService
  }
  
  @MainActor
  func fetchVacancy() async {
    do {
      detailedVacancy = try await detailedVacancyFetchingService.fetchVacancy(id: vacancyId)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  private func stripTags(html: String) -> String {
    do {
      let attributed = try NSAttributedString(data: html.data(using: .unicode)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
      return attributed.string
    } catch {
      assertionFailure("HTML string <\(html)> is expected to be converted to NSAttributedString object")
      return ""
    }
  }
}

