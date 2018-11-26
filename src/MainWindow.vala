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
                 title: "Screeny",
                 height_request: 450,
                 width_request: 450,
                 border_width: 6
            );
        }
        
        construct {            
            stack = new Gtk.Stack ();
            
            var radio_select_screen = new Gtk.RadioButton.from_widget(null);
            radio_select_screen.tooltip_text = ("Grab the whole screen");
            radio_select_screen.set_active(true);

            var radio_select_window = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_window.tooltip_text = ("Grab the current window");

            var radio_select_area = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_area.tooltip_text = ("Grab a selected area");

            var radio_selection_grid = new Gtk.Grid();
            radio_selection_grid.halign = Gtk.Align.CENTER;
            radio_selection_grid.get_style_context().add_class (Gtk.STYLE_CLASS_FLAT);
            radio_selection_grid.margin_top = 10;
            radio_selection_grid.column_spacing = 10;
            radio_selection_grid.add(radio_select_screen);
            radio_selection_grid.add(radio_select_window);
            radio_selection_grid.add(radio_select_area);
            stack.add (radio_selection_grid);
            //stack.set_visible_child (label_beemy_info);
            stack.show_all ();
            this.add (stack);

        }
    }
}