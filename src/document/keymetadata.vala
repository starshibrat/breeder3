using Gee;

namespace LabgtkStruct{
    public class KeyMetadata: GLib.Object{
        public AttributeType type;
        public int index;
        public Set<string> nominal_values;

        public KeyMetadata(){
            //nominal_values;
        }

        public int getNominalCount() throws TypeError{
            if(this.type != AttributeType.NOMINAL)
                throw new TypeError.NOT_NOMINAL("this isn't nominal");
            return this.nominal_values.size;
        }
    }

}
