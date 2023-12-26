namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/dashboard.ui")]
    public class DashboardPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;
        
        [GtkChild]
        private unowned Gtk.Box box;

        [GtkChild]
        private unowned Gtk.Button addPondButton;

        [GtkChild]
        private unowned Gtk.Grid grid;
        
        
        public DashboardPage (Gtk.Application app, User user) {
            Object (application: app);
           
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/dashboard.css");
            

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            this.user = user;
            
            print(user.username);

            List<Pond> ponds = ListPondsFunction.getPonds(this.user);

            addPondButton.clicked.connect(() => {goToAddPondPage(this.user);});
            

            //  ponds.foreach ((entry) => {
            //      var lb = new Gtk.Label(entry.alias);
            //      var box2 = new Gtk.Box(Gtk.Orientation.VERTICAL,5);
            //      Gtk.Button act;
            //      if (entry.isActive){
            //          act = new Gtk.Button.with_label("Aktif");
            //          act.set_name("active");
            //          act.set_id("active");
            //      } else {
            //          act = new Gtk.Button.with_label("Tidak Aktif");
            //          act.set_name("inactive");
            //          act.set_id("inactive");
            //      }

            //      lb.set_name("name");
            //      lb.set_id("name");
                
            //      var btn = new Gtk.Button.with_label("Detail");
            //      var bx = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
                
        
            //      btn.clicked.connect(() => {goToDetailPondPage(this.user, entry);});

            //      bx.append(lb);
            //      bx.append(act);
            //      //  bx.append(btn);
            //      bx.set_name("card");
            //      bx.set_id("card");

            //      box2.append(bx);
            //      box2.append(btn);
            //      box.append(box2);
            //  });

            int i = 0;
            int j = 0;

            ponds.foreach ((entry) => {
                var lb = new Gtk.Label(entry.alias);
                var box2 = new Gtk.Box(Gtk.Orientation.VERTICAL,5);
                Gtk.Button act;
                if (entry.isActive){
                    act = new Gtk.Button.with_label("Aktif");
                    act.set_name("active");
                    act.set_id("active");
                } else {
                    act = new Gtk.Button.with_label("Tidak Aktif");
                    act.set_name("inactive");
                    act.set_id("inactive");
                }

                lb.set_name("name");
                lb.set_id("name");
                
                var btn = new Gtk.Button.with_label("Detail");
                var bx = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
                
        
                btn.clicked.connect(() => {goToDetailPondPage(this.user, entry);});

                bx.append(lb);
                bx.append(act);
                //  bx.append(btn);
                bx.set_name("card");
                bx.set_id("card");

                box2.append(bx);
                box2.append(btn);
                grid.attach(box2, i, j, 1, 1);

                i++;
                
                if (i > 2){
                    j++;
                    i = 0;
                }



            });

            box.append(grid);
            

            

        }

        public void goToAddPondPage(User user){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.AddPondPage(this.app, user);
            win.present();
        }

        public void goToDetailPondPage(User user, Pond pond){
            Gtk.Window win= this.app.active_window;
            win = new Labgtk.PondDetailPage(this.app, user, pond);
            win.present();
            
        }

        
    }
}
