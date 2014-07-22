// ==========================================================================
// WARNING: This is work in progress. Quite a lot of work remains to be done.
//          This class is NOT ready for production :-)
// ==========================================================================

// Python docs: http://docs.python-requests.org/en/latest/

import Foundation

struct HttpResponse {
    let ok: Bool
    let text: String?
    // TODO: func json()
}

enum HttpMethod {
    case GET, POST
}

class HttpSession {
    var cookies: [String : String] = [:]

    func _make_request(methodType: HttpMethod, url: String, data: [String : String]? = nil, dataAsString: String? = nil, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        // TODO: Handle all options.
        var nsUrl = NSURL(string: url)
        var nsMutableUrlRequest = NSMutableURLRequest(URL: nsUrl)
        if let timeoutValue = timeout {
            nsMutableUrlRequest.timeoutInterval = timeoutValue
        }
        switch (methodType) {
            case .GET:
                nsMutableUrlRequest.HTTPMethod = "GET"
            case .POST:
                nsMutableUrlRequest.HTTPMethod = "POST"
        }
        var nsUrlResponse: NSURLResponse?
        var nsError: NSError?
        var nsData = NSURLConnection.sendSynchronousRequest(nsMutableUrlRequest, returningResponse: &nsUrlResponse, error: &nsError)
        // TODO: Proper error checking. Read HTTP status code.
        var text: String?
        var ok = false
        if nsData {
            text = NSString(data: nsData, encoding: NSUTF8StringEncoding) as String
            ok = true
        }
        return HttpResponse(ok: ok, text: text)
    }

    func get(url: String, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.GET, url: url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    func post(url: String, _ data: [String : String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.POST, url: url, data: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    func post(url: String, _ data: String, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.POST, url: url, dataAsString: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }
}

class requests {
    class func Session() -> HttpSession {
        return HttpSession()
    }

    class func session() -> HttpSession {
        return Session()
    }

    class func get(url: String, params: [String: String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().get(url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    class func post(url: String, data: [String: String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().post(url, data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    class func post(url: String, _ data: [String: String]) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }

    class func post(url: String, _ data: String) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }
}
