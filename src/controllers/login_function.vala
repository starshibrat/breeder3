public class LoginFunction {
    public static User get_authenticated_user (string username, string password){

        User user = new User();
        //  ApiCall authentication = new ApiCall("http://127.0.0.1:5000", "/api/login");
        ApiCall authentication = new ApiCall("http://jft.web.id/fishapiv4", "/api/login");

        authentication.set_post();
        string data = @"username=%s&password=%s";
        data = GLib.Markup.printf_escaped (data, username, password);
        authentication.set_body(data);
        bool res = authentication.perform_call ();
        Json.Parser parser = new Json.Parser();

        print(authentication.response_str);
        uint headerCode = authentication.response_code;

        if (headerCode != 200){
            return null;
        }
            
        bool success = parser.load_from_data(authentication.response_str);

        

        print(@"parse success? $(success)\n");

        Json.Node? node = parser.get_root();

        if (!node.is_null()){

            Json.Object? jsonObject = node.get_object();
            if (jsonObject != null && jsonObject.has_member("access_token")){
                string accessToken = jsonObject.get_string_member("access_token");
                stdout.printf("Access Token: %s\n", accessToken);
                user.access_token = accessToken;
            }

            if (jsonObject != null && jsonObject.has_member("identity")){
                Json.Object? identityObject = jsonObject.get_object_member ("identity");

                if (identityObject != null){
                    user.id = identityObject.get_string_member ("id");
                    user.farm_id = identityObject.get_string_member("farm_id");
                    user.username = identityObject.get_string_member ("username");
                    user.name = identityObject.get_string_member("name");
                    user.nik = identityObject.get_string_member("nik");
                    user.phone = identityObject.get_string_member("phone");
                    user.farm_name = identityObject.get_string_member("farm_name");

                    print(user.to_string ());

                    return user;

                    
                }

            }



        }

        return new User();

    }
}