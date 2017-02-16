# URLSession-synchronousDataTask

Example:
```swift
private class func loadData(url : URL,data : String, isPost : Bool = true, headers : [String : String] = [:]) -> Data! {
  let data = data.replacingOccurrences(of: "\n", with: "\\n");
  let session = URLSession.shared;
  var request = URLRequest(url: url);
  request.httpMethod = isPost ? "POST" : "GET";
  if (isPost) {
    request.addValue("application/json", forHTTPHeaderField: "Content-Type");
    request.addValue("application/json", forHTTPHeaderField: "Accept");
    request.httpBody = (data).data(using: .utf8)!;
  }
        
  for h in headers {
    request.addValue(h.value, forHTTPHeaderField: h.key);
  }
        
  let res = session.synchronousDataTask(with: request);
  return res;
}
```
