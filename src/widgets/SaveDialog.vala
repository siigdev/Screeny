namespace Screenshot.Widgets {
    public class SaveDialog : Gtk.Dialog {
        public Settings settings { get; construct; }



        public SaveDialog () {
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
            var format_combobox = new Gtk.ComboBoxText();
            format_cmb.append_text ("png");
            format_cmb.append_text ("jpeg");
            format_cmb.append_text ("bmp");

            switch (settings.get_string ("format")) {
                case "png":
                    format_cmb.active = 0;
                    break;
                case "jpeg":
                    format_cmb.active = 1;
                    break;
                case "bmp":
                    format_cmb.active = 2;
                    break;
            }
        }
    }
}