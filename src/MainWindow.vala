namespace Screeny {
    public class MainWindow : Gtk.Window {
        public string title_name = "Screeny";
        public int window_x;
        public int window_y;

        public MainWindow (Gtk.Application application) {
            set_title (this.title_name);

        }
        construct {
            var screenshot_method = new Gtk.RadioButton (null);
            
            var radio_buttons_grid = new Gtk.Grid ();

        }
    }
}