using GLib;

namespace LabgtkStruct{
    public class Any<G>: GLib.Object {

        public G? val {get;set;}

        /**
         * Default constructor instantiate the class with empty values
         */
        public Any(G data) {
            this.val = data;
        }
    }
}

