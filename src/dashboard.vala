namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/dashboard.ui")]
    public class DashboardPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Box box;
        
        
        public DashboardPage (Gtk.Application app, User user) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/login_style.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            print(user.username);

            List<Pond> ponds = ListPondsFunction.getPonds(this.user);

            ponds.foreach ((entry) => {
                Gtk.Label l1 = new Gtk.Label(entry.alias);
                Gtk.Button detail = new Gtk.Button.with_label("Detail");
                Gtk.Box box1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
                box1.append(l1);
                box1.append(detail);
                box.append(box1);
            });


            

            


        }

        
    }
}
