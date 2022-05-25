import Foundation

final class DetailedEmployerViewModel: ObservableObject {
  
  private let employerId: String
  @Published private(set) var detailedEmployer: DetailedEmployer? {
    didSet {
      guard let employersDescription = detailedEmployer?.description else { return }
      employerDescription = stripTags(html: employersDescription)
    }
  }
  @Published private(set) var employerDescription: String?
  @Published var presentedError = false
  private let detailedEmployerFetchingService: DetailedEmployerFetchService
  
  init(employerId: String, detailedEmployerFetchingService: DetailedEmployerFetchService = DetailedEmployerFetchService()) {
    self.employerId = employerId
    self.detailedEmployerFetchingService = detailedEmployerFetchingService
  }
  
  @MainActor
  func fetchEmployer() async {
    do {
      detailedEmployer = try await detailedEmployerFetchingService.fetchEmployer(id: employerId)
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

