namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/dashboard.ui")]
    public class DashboardPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Box box;

        [GtkChild]
        private unowned Gtk.Button addPondButton;
        
        
        public DashboardPage (Gtk.Application app, User user) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/login_style.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            print(user.username);

            List<Pond> ponds = ListPondsFunction.getPonds(this.user);

            addPondButton.clicked.connect(() => {goToAddPondPage(this.user);});

            ponds.foreach ((entry) => {
                var lb = new Gtk.Label(entry.alias);
                var btn = new Gtk.Button.with_label("Detail");
                var bx = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
                bx.append(lb);
                bx.append(btn);
                box.append(bx);
            });
            

            

        }

        public void goToAddPondPage(User user){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.AddPondPage(this.app, user);
            win.present();
            this.close();
        }

        
    }
}
