namespace Screeny {
    public class MainWindow : Gtk.Window {
        //public int window_x;
        //public int window_y;
        public Gtk.Stack stack;
        public Gtk.Label label_screeny;
        public Gtk.RadioButton radio_select_screen; 
        public Gtk.RadioButton radio_select_window;
        public Gtk.RadioButton radio_select_area;

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
            create_screenshot_view();
            create_grid();           
            create_stack();
            create_view();

        }
        public void create_screenshot_view() {
            label_screeny = new Gtk.Label ("Screeny");
            label_screeny.set_halign (Gtk.Align.CENTER);

            radio_select_screen = new Gtk.RadioButton.from_widget(null);
            radio_select_screen.tooltip_text = ("Grab the whole screen");
            radio_select_screen.set_active(true);

            radio_select_window = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_window.tooltip_text = ("Grab the current window");

            radio_select_area = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_area.tooltip_text = ("Grab a selected area");
        }

        private Gtk.Grid radio_selection_grid;
        public void create_grid() {
            radio_selection_grid = new Gtk.Grid();
            radio_selection_grid.add(label_screeny);
            radio_selection_grid.halign = Gtk.Align.CENTER;
            radio_selection_grid.get_style_context().add_class (Gtk.STYLE_CLASS_FLAT);
            radio_selection_grid.margin_top = 10;
            radio_selection_grid.column_spacing = 10;
            radio_selection_grid.add(radio_select_screen);
            radio_selection_grid.add(radio_select_window);
            radio_selection_grid.add(radio_select_area);

        }

        public void create_gif_view()  {
            
        }
        public void gif_grid()  {

        }

        public void create_stack() {
            stack = new Gtk.Stack();
            stack.add(radio_selection_grid);
            stack.set_visible_child(radio_selection_grid);
        }
        public void create_view() {
            this.add(stack);
            stack.show_all();
        }
    }
}