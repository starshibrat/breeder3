namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/pond_detail_page.ui")]
    public class PondDetailPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Button back;

        [GtkChild]
        private unowned Gtk.Box box;
        
        [GtkChild]
        private unowned Gtk.Label name_info;

        [GtkChild]
        private unowned Gtk.Label location_info;

        [GtkChild]
        private unowned Gtk.Label shape_info;
        
        public PondDetailPage (Gtk.Application app, User user, Pond pond) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/dashboard.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            print(user.username);

            back.clicked.connect(
                () => {
                    goToDashboard(this.user);
                }
            );

            
            name_info.set_text (name_info.get_text () + pond.alias);
            location_info.set_text(location_info.get_text() + pond.location);
            shape_info.set_text(shape_info.get_text () + pond.shape);
            

            

        }

        public void goToDashboard(User user){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.DashboardPage(this.app, user);
            win.present();
            this.close();
        }

        

        
    }
}
