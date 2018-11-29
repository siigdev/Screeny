namespace Screenshot.Widgets {
    public class SaveDialog : Gtk.Dialog {
        public Settings settings { get; construct; }
        public Gtk.Label dialog_label;
        public Gtk.Label name_label;
        public Gtk.Label format_label;
        public Gtk.Label web_label;
        public Gtk.Label folder_label
        public Gtk.Entry name_entry;
        public Gtk.ComboBoxText format_combobox;
        public Gtk.ComboBoxText web_combobox;
        public Gtk.FileChooserButton folder_chooser;

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
            dialog_label = new Gtk.Label ("Save Screenshot as...");
            name_label = new Gtk.Label ("Name: ");
            name_entry = new Gtk.Entry ();
            name_entry.hexpand = true;
            //name_entry.text = file_name;

            format_label = new Gtk.Label ("Format: ");
            format_combobox = new Gtk.ComboBoxText();
            format_cmb.append_text ("png");
            format_cmb.append_text ("jpeg");
            format_cmb.append_text ("bmp");
            format_cmb.append_text ("pdf");

            web_label = new Gtk.Label ("Upload: ");
            web_combobox = new Gtk.ComboBoxText();
            web_combobox.append_text ("Imgur");
            web_combobox.append_text ("Cloudinary");

            folder_label = new Gtk.Label ("Folder: ");
            folder_chooser = new Gtk.FileChooserButton("Select Screenshots Folder…"), Gtk.FileChooserAction.SELECT_FOLDER); 
            //folder_chooser.set_current_folder (folder_dir);







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