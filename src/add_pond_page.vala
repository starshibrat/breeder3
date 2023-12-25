namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/add_pond_page.ui")]
    public class AddPondPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Box box;
        [GtkChild]
        private unowned Gtk.Entry alias;
        [GtkChild]
        private unowned Gtk.Entry location;
        [GtkChild]
        private unowned Gtk.Entry shape;
        [GtkChild]
        private unowned Gtk.Entry material;
        [GtkChild]
        private unowned Gtk.Entry length;
        [GtkChild]
        private unowned Gtk.Entry width;
        [GtkChild]
        private unowned Gtk.Entry height;
        [GtkChild]
        private unowned Gtk.Button back;
        [GtkChild]
        private unowned Gtk.Button addButton;
        
        public AddPondPage (Gtk.Application app, User user) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/login_style.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            addButton.clicked.connect( () => {
                    float length_float = float.parse(length.get_text());
                    float height_float = float.parse(height.get_text());
                    float width_float = float.parse(width.get_text());

                    AddPondFunction.add_pond(this.user, alias.get_text(), location.get_text(), shape.get_text(), material.get_text(), length_float, width_float, height_float);
                });


            

            back.clicked.connect(
                () => {
                    goToDashboard(this.user);
                }
            );

            

        }

        public void goToDashboard(User user){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.DashboardPage(this.app, user);
            win.present();
            this.close();
        }

        
    }
}
