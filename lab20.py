from System.Net import HttpListener

RESPONSE = tuple([x for x in b"hello world"])

http_listener = HttpListener()
http_listener.Prefixes.Add("http://localhost:8000/")
http_listener.Start()
print ("Started")

try:
    while True:
        context = http_listener.GetContext()
        request = context.Request
        response = context.Response
        response.ContentLength64 = len(RESPONSE)
        output = response.OutputStream
        output.Write(RESPONSE, 0,len(RESPONSE))
        output.Close()
except KeyboardInterrupt:
    http_listener.Stop()
