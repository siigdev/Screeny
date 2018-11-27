namespace Screeny {
    public class MainWindow : Gtk.ApplicationWindow {
        private enum CaptureType{
            SCREEN, CURR_WINDOW, AREA, GIF
        }
        private CaptureType capture_mode;
        public Gtk.RadioButton radio_select_screen; 
        public Gtk.RadioButton radio_select_window;
        public Gtk.RadioButton radio_select_area;
        public Gtk.RadioButton radio_select_gif;
        public Gtk.Button close_btn;
        public Gtk.Button capture_btn;
        public Gtk.ButtonBox actions;
        public Gtk.Switch pointer_switch;
        public Gtk.Label pointer_label;
        public Gtk.Switch websave_switch;
        public Gtk.Label websave_label;
        public Gtk.Switch clipboard_switch;
        public Gtk.Label clipboard_label;
        public Gtk.SpinButton delay_spinner;
        public Gtk.Label delay_label;
        public Gtk.Stack stack;
        
        public MainWindow (Gtk.Application application) {
            GLib.Object (application: application,
                 icon_name: "com.github.siigdev.screeny",
                 resizable: false,
                 title: "",
                 height_request: 400,
                 width_request: 350,
                 border_width: 6
            );
        }
        
        construct {   
            //Stylesheet provider
            var cssprovider = new Gtk.CssProvider ();
            cssprovider.load_from_resource ("/com/github/siigdev/screeny/stylesheet.css");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), cssprovider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            set_keep_above (true);

            create_titlebar();  

            create_screenshot_view();
            create_screenshot_grid();   
            
            create_stack();

            create_view();
            create_button_functionality();

        }
        public Gtk.HeaderBar titlebar;
        public void create_titlebar() {
            titlebar = new Gtk.HeaderBar ();

            //Radio buttons for screenshot grabbing methods
            radio_select_screen = new Gtk.RadioButton.from_widget(null);
            radio_select_screen.tooltip_text = ("Grab the whole screen");
            radio_select_screen.set_active(true);
            radio_select_window = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_window.tooltip_text = ("Grab the current window");
            radio_select_area = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_area.tooltip_text = ("Grab a selected area");
            radio_select_gif = new Gtk.RadioButton.from_widget(radio_select_screen);
            radio_select_gif.tooltip_text = ("Create a gif animation");

            //Adding screenshot selection grid
            radio_screenshot_grid = new Gtk.Grid();
            radio_screenshot_grid.halign = Gtk.Align.CENTER;
            radio_screenshot_grid.margin = 20;
            radio_screenshot_grid.column_spacing = 10;
            radio_screenshot_grid.add(radio_select_screen);
            radio_screenshot_grid.add(radio_select_window);
            radio_screenshot_grid.add(radio_select_area);
            radio_screenshot_grid.add(radio_select_gif);

            //Title bar settings
            titlebar.has_subtitle = false;
            titlebar.set_custom_title (radio_screenshot_grid);
            var titlebar_style_context = titlebar.get_style_context ();
            titlebar_style_context.add_class (Gtk.STYLE_CLASS_FLAT);
            titlebar_style_context.add_class ("default-decoration");
            
        }

        private Gtk.Grid radio_screenshot_grid;
        public void create_screenshot_view() {

            //Grab mouse pointer settings
            pointer_label = new Gtk.Label("Grab mouse pointer");
            pointer_label.halign = Gtk.Align.END;
            pointer_switch = new Gtk.Switch ();
            pointer_switch.halign = Gtk.Align.START;

            //Save to web settings
            websave_label = new Gtk.Label("Save to the web");
            websave_label.halign = Gtk.Align.END;
            websave_switch = new Gtk.Switch ();
            websave_switch.halign = Gtk.Align.START;

            //Save to clipboard
            clipboard_label = new Gtk.Label("Save to clipboard");
            clipboard_label.halign = Gtk.Align.END;
            clipboard_switch = new Gtk.Switch ();
            clipboard_switch.halign = Gtk.Align.START;

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
            actions.margin_top = 20;;
            actions.spacing = 6;
            actions.add(close_btn);
            actions.add(capture_btn);
        }

        private Gtk.Grid screenshot_grid;
        public void create_screenshot_grid() {
            screenshot_grid = new Gtk.Grid();
            screenshot_grid.halign = Gtk.Align.CENTER;
            screenshot_grid.margin_top = 0;
            screenshot_grid.row_spacing = 6;
            screenshot_grid.column_spacing = 6;
            screenshot_grid.row_spacing = 6;
            //screenshot_grid.attach(radio_screenshot_grid, 0, 1, 2, 1);
            screenshot_grid.attach(pointer_label, 0, 2, 1, 1);
            screenshot_grid.attach(pointer_switch, 1, 2, 1, 1);
            screenshot_grid.attach(websave_label, 0, 3, 1, 1);
            screenshot_grid.attach(websave_switch, 1, 3, 1, 1);
            screenshot_grid.attach(clipboard_label, 0, 4, 1, 1);
            screenshot_grid.attach(clipboard_switch, 1, 4, 1, 1);
            screenshot_grid.attach(delay_label, 0, 5, 1, 1);
            screenshot_grid.attach(delay_spinner, 1, 5, 1, 1);
            screenshot_grid.attach(actions, 0, 6, 2, 1);
        }
        
        public void create_stack() {
            stack = new Gtk.Stack();
            stack.margin = 6;
            stack.margin_top = 0;
            stack.homogeneous = true;
            stack.add(screenshot_grid);
            stack.set_visible_child(screenshot_grid);
        }
        public void create_button_functionality() {
            radio_select_window.toggled.connect (() => {
                capture_mode = CaptureType.CURR_WINDOW;
            });
            radio_select_screen.toggled.connect (() => {
                capture_mode = CaptureType.SCREEN;
            });
            radio_select_area.toggled.connect (() => {
                capture_mode = CaptureType.AREA;
            });
            radio_select_gif.toggled.connect (() => {
                capture_mode = CaptureType.GIF;
            });
            close_btn.clicked.connect (() => {
                destroy ();
            });
        }

        public void create_view() {
            this.add(stack);
            this.set_titlebar(titlebar);
            this.show_all();
            this.get_style_context ().add_class ("rounded");
        }
    }
}