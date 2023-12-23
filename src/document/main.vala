/* main.vala
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
using Gee;
using GLib;

int main (string[] args)
{
    string path = "/home/eka/Projects/LabDPBO/iris.arff";
    Document doc = IOUtil.read_file (path);
    doc.buildIndex ();
    //Gee.List<string> numberVectors = generate_random_string (10000, 6);
    //Gee.Map<string, Gee.List> index = createIndex(numberVectors);
    return 0;
}
