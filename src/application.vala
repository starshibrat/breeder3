/* application.vala
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

using GLib;
using LabgtkStruct;

namespace Labgtk {
    public class Application : Gtk.Application {
        public Application () {
            Object (application_id: "unj.dpbo.labgtk", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit },
                { "open", this.open_file }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            Gtk.Window win = this.active_window;
            if (win == null) {
                //win = new Labgtk.ContentWindow (this);
                //win = new Labgtk.AddDataWindow (this);
                win = new Labgtk.Window(this);
            }
            win.present ();
        }

        private void open_file(){
            //print("function was called");
            Gtk.FileChooserDialog dialog = new Gtk.FileChooserDialog ("Load arff",
                        this.active_window, Gtk.FileChooserAction.OPEN,
                         "_Cancel", Gtk.ResponseType.CANCEL,
                           "_Open", Gtk.ResponseType.ACCEPT, null);
            // Gtk.Widget accept = dialog.get_widget_for_response (Gtk.ResponseType.ACCEPT);
            dialog.response.connect (on_open_response);
            // accept.connect ("clicked", on_open_response, null);
            dialog.show ();
        }

        private void on_open_response(Gtk.Dialog dialog, int response){
            //print("response code: %d\n", response);
            //print("%d\n", Gtk.ResponseType.ACCEPT);
            //print("%d\n", Gtk.ResponseType.CANCEL);
            if(response == Gtk.ResponseType.ACCEPT){
                print("on_open_response");
                Gtk.FileChooser chooser = (Gtk.FileChooser)dialog;
                GLib.File file = chooser.get_file();
                LabgtkStruct.Document doc = IOUtil.load_file (file);
                dialog.close();
            }
            else if(response == Gtk.ResponseType.CANCEL){
                dialog.close();
            }
            //dialog.destroy();
        }

        private void on_about_action () {

            string[] authors = { "Eka" };
            Gtk.show_about_dialog (this.active_window,
                                   "program-name", "labgtk",
                                   "logo-icon-name", "unj.dpbo.labgtk",
                                   "authors", authors,
                                   "version", "0.1.0",
                                   "copyright", "© 2023 Eka");
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
