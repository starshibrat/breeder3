namespace Labgtk {

    [GtkChild]
    private unowned Gtk.Box theBox;

    [GtkTemplate (ui = "/unj/dpbo/labgtk/dashboard.ui")]
    public class DashboardPage : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        private User user;

        public DashboardPage(Gtk.Application app, User user){
            Object (application: app);
            this.app = app;
            this.user = user;

            print(user.username);

            var box1 = new Gtk.Box(Gtk.Orientation.VERTICAL,3);
            string[] arr1 = {"hosoda", "mutou", "asano"};
            for (int i = 0; i < arr1.length; i++){
                var a = new Gtk.Label(arr1[i]);
                box1.append(a);
            }

            theBox.append(box1);

        }

    }

}