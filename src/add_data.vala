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
    [GtkTemplate (ui = "/unj/dpbo/labgtk/add_data.ui")]
    public class AddDataWindow : Gtk.ApplicationWindow {
        //[GtkChild]
        //private unowned Gtk.Label label;
        //[GtkChild]
        //private unowned Gtk.Button buttonX;
        [GtkChild]
        private unowned Gtk.Entry entry0;

        [GtkChild]
        private unowned Gtk.Button addBtn;


        public AddDataWindow (Gtk.Application app) {
            Object (application: app);

            Gtk.CssProvider css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource("/unj/dpbo/labgtk/style.css");

            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        private void handleAdd(){
            //get entry0 value
            string entryText = entry0.text;
        }
    }
}
