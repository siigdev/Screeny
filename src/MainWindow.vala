namespace Screeny {
    public class MainWindow : Gtk.Window {
        //public int window_x;
        //public int window_y;
        public Gtk.Stack stack;
        public Gtk.RadioButton radio_select_screen; 
        public Gtk.RadioButton radio_select_window;
        public Gtk.RadioButton radio_select_area;
        public Gtk.Button close_btn;
        public Gtk.Button capture_btn;
        public Gtk.ButtonBox actions;
        public Gtk.Switch pointer_switch;
        public Gtk.Label pointer_label;
        public Gtk.SpinButton delay_spinner;
        public Gtk.Label delay_label;
        

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
            //Stylesheet provider
            var cssprovider = new Gtk.CssProvider ();
            cssprovider.load_from_resource ("/com/github/siigdev/screeny/stylesheet.css");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), cssprovider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

            create_header();  
            create_screenshot_view();
            create_grid();           
            create_stack();
            create_view();

            create_button_functionality();

        }
        private Gtk.HeaderBar titlebar;
        public void create_header() {
            titlebar = new Gtk.HeaderBar();
            titlebar.has_subtitle = false;
            titlebar.show_close_button = true;
            var titlebar_style_context = titlebar.get_style_context ();
            titlebar_style_context.add_class (Gtk.STYLE_CLASS_FLAT);
            titlebar_style_context.add_class ("default-decoration");
        }
        private Gtk.Grid radio_selection_grid;
        public void create_screenshot_view() {

            //Radio buttons for screenshot grabbing methods
            radio_select_screen = new Gtk.RadioButton.from_widget(null);
            radio_select_screen.tooltip_text = ("Grab the whole screen");
            radio_select_screen.set_active(true);

            radio_select_window = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_window.tooltip_text = ("Grab the current window");

            radio_select_area = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_area.tooltip_text = ("Grab a selected area");

            //Adding screenshot selection grid
            radio_selection_grid = new Gtk.Grid();
            radio_selection_grid.halign = Gtk.Align.CENTER;
            radio_selection_grid.column_spacing = 5;
            radio_selection_grid.add(radio_select_screen);
            radio_selection_grid.add(radio_select_window);
            radio_selection_grid.add(radio_select_area);

            //Grab mouse pointer settings
            pointer_label = new Gtk.Label("Grab mouse pointer");
            pointer_label.halign = Gtk.Align.END;
            pointer_switch = new Gtk.Switch ();
            pointer_switch.halign = Gtk.Align.START;

            //Screenshot delay in seconds
            delay_label = new Gtk.Label("Delay in seconds");
            delay_label.halign = Gtk.Align.END;
            delay_spinner = new Gtk.SpinButton.with_range(0,15,1);

            //Close and capture buttonbox
            close_btn = new Gtk.Button.with_label ("Close");
            capture_btn = new Gtk.Button.with_label ("Capture Screenshot");
            capture_btn.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
            actions = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
            actions.halign = Gtk.Align.END;
            actions.margin_top = 24;
            actions.spacing = 6;
            actions.add(close_btn);
            actions.add(capture_btn);
        }

        private Gtk.Grid selection_grid;
        public void create_grid() {
            selection_grid = new Gtk.Grid();
            selection_grid.halign = Gtk.Align.CENTER;
            selection_grid.get_style_context().add_class (Gtk.STYLE_CLASS_FLAT);
            selection_grid.margin = 6;
            selection_grid.margin_top = 0;
            selection_grid.row_spacing = 6;
            selection_grid.column_spacing = 12;
            selection_grid.attach(radio_selection_grid, 0, 0, 2, 1);
            selection_grid.attach(pointer_label, 0, 2, 1, 1);
            selection_grid.attach(pointer_switch, 1, 2, 1, 1);
            selection_grid.attach(delay_label, 0, 3, 1, 1);
            selection_grid.attach(delay_spinner, 1, 3, 1, 1);
            selection_grid.attach(actions, 0, 4, 2, 1);

        }

        public void create_gif_view()  {
            
        }
        public void gif_grid()  {

        }
        public void create_button_functionality() {
            close_btn.clicked.connect (() => {
                destroy ();
            });
        }
        public void create_stack() {
            stack = new Gtk.Stack();
            stack.add(selection_grid);
            stack.set_visible_child(selection_grid);
        }
        public void create_view() {
            this.add(stack);
            stack.show_all();
            this.set_titlebar (titlebar);
        }
    }
}