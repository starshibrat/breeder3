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
    [GtkTemplate (ui = "/unj/dpbo/labgtk/content_window.ui")]
    public class ContentWindow : Gtk.ApplicationWindow {
        //[GtkChild]
        //private unowned Gtk.Label label;
        //[GtkChild]
        //private unowned Gtk.Button buttonX;
        [GtkChild]
        private unowned Gtk.Box primaryBoxLayout;

        weak Gtk.Application app;

        public ContentWindow (Gtk.Application app) {
            Object (application: app);
            this.app = app;
            //print("Label text= " + this.label.label);
            //this.header_bar.
            //
            primaryBoxLayout.set_orientation (Gtk.Orientation.VERTICAL);
            Gtk.Button button = new Gtk.Button.with_label ("Label Test");
            Gtk.Button button2 = new Gtk.Button.with_label ("Label 2");
            //add child to box layout
            //Gtk.Box secondLayout = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 8);
            Gtk.Grid grid = new Gtk.Grid();
            primaryBoxLayout.append (button);
            primaryBoxLayout.append (button2);
            primaryBoxLayout.append(grid);
            //Gtk.Alignment alignWrapper = new Gtk.align();
            Gtk.Button addDataBtn = new Gtk.Button.with_label ("Add");
            addDataBtn.set_halign(Gtk.Align.END);

            addDataBtn.clicked.connect(handleAddButton);
            //grid.insert_row(0);
            //grid.insert_column(2);
            //secondLayout.append(addDataBtn);
            grid.attach(addDataBtn, 1, 0);
            //grid.attach(addDataBtn, 1, 0);
            grid.set_column_homogeneous(true);
            //this.add_css_class ("style.css");
            //buttonX.set_margin_start(16);
            //this.get_style_context ().add_provider (css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            //print("%s\n", buttonX.get_name ());
            //print("%s\n", buttonX.get_id ());
            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/style.css");

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        construct {
            //set boxLayout orientation to vertical
        }

        private void handleAddButton(){
            //replace current window with add_data
            print("Handle was called");
            Gtk.Window win = this.app.active_window;
            win = new Labgtk.AddDataWindow(this.app);

            win.present();
        }
    }
}
