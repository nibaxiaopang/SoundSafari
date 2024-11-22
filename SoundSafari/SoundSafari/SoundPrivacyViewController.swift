//
//  SoundPrivacyViewController.swift
//  SoundSafari
//
//  Created by SoundSafari on 2024/11/22.
//

import UIKit
@preconcurrency import WebKit
class SoundPrivacyViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var soundIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var soundWebView: WKWebView!
    @IBOutlet weak var soundBackBtn: UIButton!
    @IBOutlet weak var soundTopCos: NSLayoutConstraint!
    @IBOutlet weak var soundBottomCos: NSLayoutConstraint!
    var soundBackAction: (() -> Void)?
    var confData: [Any]?
    @objc var url: String?
    
    func soundGenerateRandomColor() {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        print("Generated random color: \(randomColor)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.confData = UserDefaults.standard.array(forKey: UIViewController.getRnergyUserDefaultKey())
        soundGenerateRandomColor()
        soundInitSubViews()
        soundInitConfigNav()
        soundInitWebView()
        soundStartLoadWebView()
    }
    
    @IBAction func backC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let confData = confData, confData.count > 4 {
            let top = (confData[3] as? Int) ?? 0
            let bottom = (confData[4] as? Int) ?? 0
            
            if top > 0 {
                soundTopCos.constant = view.safeAreaInsets.top
            }
            if bottom > 0 {
                soundBottomCos.constant = view.safeAreaInsets.bottom
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }
    
    @objc func backClick() {
        soundBackAction?()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - INIT
    private func soundInitSubViews() {
        soundWebView.scrollView.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .black
        soundWebView.backgroundColor = .black
        soundWebView.isOpaque = false
        soundWebView.scrollView.backgroundColor = .black
        soundIndicatorView.hidesWhenStopped = true
    }
    
    private func soundInitConfigNav() {
        soundBackBtn.isHidden = navigationController == nil
        
        guard let url = url, !url.isEmpty else {
            soundWebView.scrollView.contentInsetAdjustmentBehavior = .automatic
            return
        }
        
        soundBackBtn.isHidden = true
        navigationController?.navigationBar.tintColor = .systemBlue
        
        let image = UIImage(systemName: "xmark")
        let rightButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backClick))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func soundInitWebView() {
        guard let confData = confData, confData.count > 7 else { return }
        
        let userContentC = soundWebView.configuration.userContentController
        
        if let trackStr = confData[5] as? String {
            let trackScript = WKUserScript(source: trackStr, injectionTime: .atDocumentStart, forMainFrameOnly: false)
            userContentC.addUserScript(trackScript)
        }
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let bundleId = Bundle.main.bundleIdentifier,
           let wgName = confData[7] as? String {
            let inPPStr = "window.\(wgName) = {name: '\(bundleId)', version: '\(version)'}"
            let inPPScript = WKUserScript(source: inPPStr, injectionTime: .atDocumentStart, forMainFrameOnly: false)
            userContentC.addUserScript(inPPScript)
        }
        
        if let messageHandlerName = confData[6] as? String {
            userContentC.add(self, name: messageHandlerName)
        }
        
        soundWebView.navigationDelegate = self
        soundWebView.uiDelegate = self
    }
    
    let privacyUrl = "https://www.termsfeed.com/live/87fbd71b-055f-4dba-b166-c710507962d4"
    private func soundStartLoadWebView() {
        let urlStr = url ?? privacyUrl
        guard let url = URL(string: urlStr) else { return }
        
        soundIndicatorView.startAnimating()
        let request = URLRequest(url: url)
        soundWebView.load(request)
    }
    
    // MARK: - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let confData = confData, confData.count > 9 else { return }
        
        let name = message.name
        if name == (confData[6] as? String),
           let trackMessage = message.body as? [String: Any] {
            let tName = trackMessage["name"] as? String ?? ""
            let tData = trackMessage["data"] as? String ?? ""
            if let data = tData.data(using: .utf8) {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        if tName != (confData[8] as? String) {
                            soundSendEvent(tName, values: jsonObject)
                            return
                        }
                        if tName == (confData[9] as? String) {
                            return
                        }
                        if let adId = jsonObject["url"] as? String, !adId.isEmpty {
                            soundReloadWebViewData(adId)
                        }
                    }
                } catch {
                    soundSendEvent(tName, values: [tName: data])
                }
            } else {
                soundSendEvent(tName, values: [tName: tData])
            }
        }
    }
    
    private func soundReloadWebViewData(_ adurl: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let storyboard = self.storyboard,
               let adView = storyboard.instantiateViewController(withIdentifier: "SoundPrivacyViewController") as? SoundPrivacyViewController {
                adView.url = adurl
                adView.soundBackAction = { [weak self] in
                    let close = "window.closeGame();"
                    self?.soundWebView.evaluateJavaScript(close, completionHandler: nil)
                }
                let nav = UINavigationController(rootViewController: adView)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.soundIndicatorView.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.soundIndicatorView.stopAnimating()
        }
    }
    
    // MARK: - WKUIDelegate
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil, let url = navigationAction.request.url {
            UIApplication.shared.open(url)
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let authenticationMethod = challenge.protectionSpace.authenticationMethod
        if authenticationMethod == NSURLAuthenticationMethodServerTrust,
           let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        }
    }

}
