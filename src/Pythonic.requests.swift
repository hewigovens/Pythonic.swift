// ==========================================================================
// WARNING: This is work in progress. Quite a lot of work remains to be done.
//          This class is NOT ready for production :-)
// ==========================================================================

// Python docs: http://docs.python-requests.org/en/latest/

import Foundation

public struct HttpResponse {
    public let ok: Bool
    public let text: String?
    // TODO: func json()
}

public enum HttpMethod {
    case GET, POST
}

public class HttpUtils {
    public class func encodeDictionaryAsPercentEscapedString(dictionary: Dictionary<String, String>) -> String {
        var parts: [String] = []
        for (key, value) in dictionary {
            var encodedKey = (key as NSString).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            var encodedValue = (value as NSString).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            parts += "\(encodedKey)=\(encodedValue)"
        }
        return join("&", parts)
    }
}

public class HttpSession {
    public var cookies: [String : String] = [:]

    public func _make_request(methodType: HttpMethod, url: String, data: [String : String]? = nil, dataAsString: String? = nil, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
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
                var stringToPost: String!
                if let dictToPost = data {
                    stringToPost = HttpUtils.encodeDictionaryAsPercentEscapedString(dictToPost)
                } else if dataAsString != nil {
                    stringToPost = dataAsString!
                } else {
                    assert(false)
                }
                nsMutableUrlRequest.HTTPMethod = "POST"
                var postData: NSData = NSString(string: stringToPost).dataUsingEncoding(NSUTF8StringEncoding)
                nsMutableUrlRequest.setValue("\(postData.length)", forHTTPHeaderField: "Content-Length")
                nsMutableUrlRequest.setValue("application/x-www-form-urlencoded charset=utf-8", forHTTPHeaderField: "Content-Type")
                nsMutableUrlRequest.HTTPBody = postData
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

    public func get(url: String, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.GET, url: url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public func post(url: String, _ data: [String : String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.POST, url: url, data: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public func post(url: String, _ data: String, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return _make_request(.POST, url: url, dataAsString: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }
}

public class requests {
    public class func Session() -> HttpSession {
        return HttpSession()
    }

    public class func session() -> HttpSession {
        return Session()
    }

    public class func get(url: String, params: [String: String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().get(url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public class func post(url: String, data: [String: String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().post(url, data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public class func post(url: String, _ data: [String: String]) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }

    public class func post(url: String, _ data: String) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }
}
