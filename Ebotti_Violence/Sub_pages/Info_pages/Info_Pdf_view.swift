//
//  Info_Pdf_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit
import PDFKit

class Info_Pdf_view: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = title_str
        self.view.backgroundColor = .white
        // Set up PdfViewer
        
        // this line
           self.edgesForExtendedLayout = []
        
        self.view.addSubview(pdfView)
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pdfView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        pdfView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
  
        // Open pdf
        self.open_pdf()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
