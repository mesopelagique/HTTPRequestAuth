//%attributes = {}
var $headers : Object
$headers:=New object:C1471()
$headers["field1"]:="value1"

var $myHttpRequestOptions : cs:C1710.MyHttpRequestOptions
$myHttpRequestOptions:=cs:C1710.MyHttpRequestOptions.new("GET"; $headers; "")

var $request : 4D:C1709.HTTPRequest
$request:=4D:C1709.HTTPRequest.new("https://httpbin.org/basic-auth/user/passwd"; $myHttpRequestOptions)
$request.wait()

ASSERT:C1129($request.response.status=401/* not authorized*/)

$myHttpRequestOptions.authBasic("user"; "passwd")
$request:=4D:C1709.HTTPRequest.new("https://httpbin.org/basic-auth/user/passwd"; $myHttpRequestOptions)
$request.wait()


ASSERT:C1129($request.response.status=200/*authorized*/)