namespace Labgtk{

    [GtkTemplate (ui = "/unj/dpbo/labgtk/register_page.ui")]
    public class RegisterPage : Gtk.ApplicationWindow {

        weak Gtk.Application app;

        [GtkChild]
        private unowned Gtk.Entry username;
        [GtkChild]
        private unowned Gtk.PasswordEntry password;
        [GtkChild]
        private unowned Gtk.Entry name;
        [GtkChild]
        private unowned Gtk.Entry nik;
        [GtkChild]
        private unowned Gtk.Entry phone;
        [GtkChild]
        private unowned Gtk.DropDown hasFarmChoices;
        [GtkChild]
        private unowned Gtk.Button registerButton;
        [GtkChild]
        private unowned Gtk.Button goLogin;
        [GtkChild]
        private unowned Gtk.Entry farm_name;
        [GtkChild]
        private unowned Gtk.Entry breeder;
        [GtkChild]
        private unowned Gtk.Entry address;
        
        public RegisterPage (Gtk.Application app){
            Object (application: app);
            this.app = app;
            string hasFarm = "";

            if (hasFarmChoices.get_selected() == 0){
                hasFarm = "Belum";
            } else if (hasFarmChoices.get_selected() == 1) {
                hasFarm = "Sudah";
            }

            registerButton.clicked.connect(()=> {

                User user = RegisterFunction.get_authenticated_user(username.get_text(), password.get_text(), name.get_text(), nik.get_text(), phone.get_text(), hasFarm, farm_name.get_text(), breeder.get_text(), address.get_text());

                if (user != null && user != new User()){
                    print("register success");
                }
                
            });

            goLogin.clicked.connect(navigate);



        }

        public void navigate(){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.Window(this.app);
            win.present();
            this.close();

        }

    }


}