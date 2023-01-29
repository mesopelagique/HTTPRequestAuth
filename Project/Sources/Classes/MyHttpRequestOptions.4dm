Class constructor($method : Text; $headers : Object; $body : Text)
	This:C1470.method:=$method
	This:C1470.headers:=$headers
	This:C1470.body:=$body
	
	If (This:C1470.headers=Null:C1517)
		This:C1470.headers:=New object:C1471
	End if 
	
Function authBasic($user : Text; $password : Text)
	var $encoded : Text
	BASE64 ENCODE:C895($user+":"+$password; $encoded)
	This:C1470.headers["Authorization"]:="Basic "+$encoded
	
	
Function onResponse($request : 4D:C1709.HTTPRequest; $event : Object)
	//My onResponse method, if you want to handle the request asynchronously
	
Function onError($request : 4D:C1709.HTTPRequest; $event : Object)
	//My onError method, if you want to handle the request asynchronously