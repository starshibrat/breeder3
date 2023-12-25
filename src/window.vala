/* window.vala
 *
 * Copyright 2023 Eka
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Labgtk {


    [GtkTemplate (ui = "/unj/dpbo/labgtk/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        weak Gtk.Application app;
        [GtkChild]
        private unowned Gtk.Button registerPageButton;
        [GtkChild]
        private unowned Gtk.Box box;
        [GtkChild]
        private unowned Gtk.Entry username;
        [GtkChild]
        private unowned Gtk.PasswordEntry password;
        [GtkChild]
        private unowned Gtk.Button loginButton;
        [GtkChild]
        private unowned Gtk.Image image;
        


        public Window (Gtk.Application app) {
            Object (application: app);
            //print("Label text= " + this.label.label);
            //this.header_bar.
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/login_style.css");
            image.set_from_resource("/unj/dpbo/labgtk/assets/logov2.png");

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
            this.app = app;
            registerPageButton.clicked.connect(navigate);

            loginButton.clicked.connect(
                () => {
                    
                    User user = LoginFunction.get_authenticated_user(username.get_text(), password.get_text());

                    if (user != null && user != new User()){
                        print("login success\n");
                        goToDashboard(user);
                    }

                }
            );

            


        }

        public void navigate(){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.RegisterPage(this.app);
            win.present();
            this.close();
        }


        public void goToDashboard(User user){
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.DashboardPage(this.app, user);
            win.present();
            this.close();
        }

        
    }
}
