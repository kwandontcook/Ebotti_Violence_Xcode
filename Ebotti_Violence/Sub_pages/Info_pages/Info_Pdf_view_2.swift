//
//  Info_Pdf_view_2.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 17/6/2022.
//

import UIKit
import PDFKit

class Info_Pdf_view_2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = title_str
        self.color_setting()
        self.view.backgroundColor = .white
        // Set up PdfViewer
        self.view.addSubview(pdfView)
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pdfView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        pdfView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss_view))
        // Open pdf
        self.open_pdf()
    }
    
    // Function - Setting up nav bar color and bar button color
    func color_setting(){
        if #available(iOS 15.0, *) {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
            barAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = barAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    
    let pdfView : PDFView = {
        let view = PDFView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoScales = true
        return view
    }()
    
    var file_name: String?
    
    var title_str:String?
    func open_pdf(){
        pdfView.document = PDFDocument(url: Bundle.main.url(forResource: file_name, withExtension: "pdf")!)
    }
    
    @objc func dismiss_view(){
        self.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
