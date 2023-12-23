private class ApiCall {
    private Soup.Session session;
    private Soup.Message message;
    private string url;
    private string body;
    
    public string response_str;
    public uint response_code;

    public class ApiCall (string endpoint, string api){
        url = endpoint + api;
        session = new Soup.Session();
        body = "";
    }

    public void set_body (string data){
        body = data;
    }

    public void set_get () {
        message = new Soup.Message("GET", url);
    }

    public void set_delete() {
        message = new Soup.Message("DELETE", url);
    }

    public void set_post(){
        message = new Soup.Message("POST", url);
    }

    public void add_header (string key, string value){
        message.request_headers.append(key, value);
    }

    public bool perform_call() {
        MainLoop loop = new MainLoop();
        bool success = false;
        debug ("Calling %s", url);
        
        if (body != ""){
            message.set_request("application/x-www-form-urlencoded", Soup.MemoryUse.COPY, body.data);
        }

        session.queue_message(message, (sess, mess) => {
            response_str = (string) mess.response_body.flatten().data;
            response_code = mess.status_code;

            if (response_str != null && response_str != "" && response_code >= 200 && response_code <= 250){
                success = true;
            }
            loop.quit();

        });
        loop.run();
        return success;
    }

    

}