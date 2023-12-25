public class AddPondFunction {

    public static void add_pond(User user, string alias, string location, string shape, string material, float length, float width, float height){
        ApiCall authentication = new ApiCall("http://jft.web.id/fishapiv4", "/api/ponds");

        authentication.set_post();
        string auth_header_value = "Bearer " + user.access_token;
        authentication.add_header("Authorization", auth_header_value);

        string build_at = "";

        string payload = "";
        payload += "alias=" + alias;
        payload += "&location=" + location;
        payload += "&shape=" + shape;
        payload += "&material=" + material;
        payload += "&length=" + length.to_string();
        payload += "&width=" + width.to_string();
        payload += "&height=" + height.to_string();
        payload += "&build_at=" + build_at;
        print(payload);

        //  data = GLib.Markup.printf_escaped (data, alias, location, shape, material, length, width, height, build_at);

        //  print(data);

        authentication.set_body(payload);
        bool res = authentication.perform_call ();
        Json.Parser parser = new Json.Parser();
        print(authentication.response_code.to_string());
        print("\n");
        print(authentication.response_str);


    }

}