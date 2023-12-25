namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/add_pond_page.ui")]
    public class AddPondPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Box box;  
        
        public AddPondPage (Gtk.Application app, User user) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/login_style.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            

            

        }

        
    }
}
