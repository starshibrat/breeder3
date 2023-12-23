public class Pond : GLib.Object, Json.Serializable{
    public string farm_id {get; set;}
    public int64 id_int {get; set;}
    public string alias {get; set;}
    public string location {get; set;}
    public string shape {get; set;}
    public string material {get; set;}
    public double length {get; set;}
    public double width {get; set;}
    public double diameter {get; set;}
    public double height {get; set;}
    public string image_name {get; set;}
    public bool isActive {get; set;}
    public DateTime build_at {get; set;}
    public DateTime created_at {get; set;}
    public DateTime updated_at{get; set;}
    public string status {get; set;}
    public string area {get; set;}
    public string volume {get; set;}

    public string to_string() {
        return @"Farm ID: $(farm_id)\n" +
               @"ID: $(id_int)\n" +
               @"Alias: $(alias)\n" +
               @"Location: $(location)\n" +
               @"Shape: $(shape)\n" +
               @"Material: $(material)\n" +
               @"Length: $(length.to_string())\n" +
               @"Width: $(width.to_string())\n" +
               @"Diameter: $(diameter.to_string())\n" +
               @"Height: $(height.to_string())\n" +
               @"Image Name: $(image_name)\n" +
               @"Is Active: $(isActive.to_string())\n"+
               @"Build at: $(build_at.to_string())\n";
              
    }



}