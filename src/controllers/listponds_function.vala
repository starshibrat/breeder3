public class ListPondsFunction {

    public static DateTime convert_string_to_datetime(string dateString){
        string[] dateTimeComponents = dateString.split(" ");
        string[] dateComponents = dateTimeComponents[0].split("-");
        string[] timeComponents = dateTimeComponents[1].split(":");
        string[] millis = timeComponents[2].split(".");

        int year = int.parse(dateComponents[0]);
        int month = int.parse(dateComponents[1]);
        int day = int.parse(dateComponents[2]);

        int hour = int.parse(timeComponents[0]);
        int minute = int.parse(timeComponents[1]);
        int second = int.parse(dateComponents[2]);
        int microsecond = int.parse(millis[1]) * 1000;

        try {
            DateTime dateTime = new DateTime(new TimeZone.local (), year, month, day, hour, minute, second);
            return dateTime;

        } catch (Error e){
            stderr.printf("Error occurred while parsing DateTime %s\n", e.message);
        }


    }


    public static List<Pond> getPonds(User user) {
        List<Pond> ponds = new List<Pond>();

        ApiCall authentication = new ApiCall("http://jft.web.id/fishapiv4", "/api/ponds");
        authentication.set_get();
        string auth_header_value = "Bearer " + user.access_token;
        authentication.add_header("Authorization", auth_header_value);

        bool res = authentication.perform_call ();
        Json.Parser parser = new Json.Parser();

        print(authentication.response_str);
        uint headerCode = authentication.response_code;

        
        bool success = parser.load_from_data(authentication.response_str);

        

        print(@"parse success? $(success)\n");
        print(authentication.response_str);

        if (success){
            Json.Node? root = parser.get_root();

            if (root != null){
                Json.Array? jsonArray = root.get_array();

                if (jsonArray != null){
                    for (uint i = 0; i < jsonArray.get_length(); i++){

                        Json.Node? node = jsonArray.get_element(i);

                        if (node != null){
                            Json.Object? jsonObject = node.get_object();
                            Pond pond = new Pond();

                            if (jsonObject != null){

                                pond.farm_id = jsonObject.get_string_member("farm_id");
                                pond.id_int = jsonObject.get_int_member("id_int");
                                pond.alias = jsonObject.get_string_member("alias");
                                pond.location = jsonObject.get_string_member("location");
                                pond.shape = jsonObject.get_string_member("shape");
                                pond.material = jsonObject.get_string_member("material");
                                //  pond.length = jsonObject.get_double_member("length");
                                //  pond.width = jsonObject.get_double_member("width");
                                //  pond.diameter = jsonObject.get_double_member("member");
                                //  pond.height = jsonObject.get_double_member("height");
                                //  pond.image_name = jsonObject.get_string_member("image_name");
                                //  pond.isActive = jsonObject.get_boolean_member("isActive");
                                //  pond.build_at = convert_string_to_datetime(jsonObject.get_string_member("build_at"));


                            }
                            

                            ponds.append(pond);

                        }


                    }
                    
                    return ponds;
                }

            }
        }

        

        return ponds;

        

    

    }
}
