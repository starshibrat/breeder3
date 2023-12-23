public class User : GLib.Object, Json.Serializable {
    public string id {get; set;}
    public string farm_id {get; set;}
    public string username {get; set;}
    public string name {get; set;}
    public string nik {get; set;}
    public string phone {get; set;}
    public string farm_name {get; set;}
    public string access_token {get; set;}

    public string to_string(){
        StringBuilder builder = new StringBuilder();
        builder.append_printf("username = %s\n", username);
        builder.append_printf("farm_id = %s\n", farm_id);
        builder.append_printf("username = %s\n", username);
        builder.append_printf("name = %s\n", name);
        builder.append_printf("nik = %s\n", nik);
        builder.append_printf("phone = %s\n", phone);
        builder.append_printf("farm_name = %s\n", farm_name);
        
        return (owned) builder.str;
    }

    

    
    

}