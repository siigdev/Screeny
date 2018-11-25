namespace Screeny {
    public class MainWindow : Gtk.Window {
        //public int window_x;
        //public int window_y;
        public Gtk.Label label_beemy_info;
        public Gtk.Stack stack;

        public MainWindow (Gtk.Application application) {
            GLib.Object (application: application,
                 icon_name: "com.github.siigdev.screeny",
                 resizable: false,
                 title: "Screeny1",
                 height_request: 450,
                 width_request: 450,
                 border_width: 6
            );
        }
        
        construct {            
            label_beemy_info = new Gtk.Label ("Calculate your Body Mass Index:");
            stack = new Gtk.Stack ();
            stack.add (label_beemy_info);
            stack.set_visible_child (label_beemy_info);
            stack.show_all ();
            this.add (stack);
            stack.show_all ();

        }
    }
}