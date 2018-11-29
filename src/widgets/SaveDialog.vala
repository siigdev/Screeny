namespace Screenshot.Widgets {
    public class SaveDialog : Gtk.Dialog {
        public Settings settings { get; construct; }
        public Gtk.Image preview_image;
        public Gtk.Label dialog_label;
        public Gtk.Label name_label;
        public Gtk.Label format_label;
        public Gtk.Label web_label;
        public Gtk.Label folder_label
        public Gtk.Entry name_entry;
        public Gtk.ComboBoxText format_combobox;
        public Gtk.ComboBoxText web_combobox;
        public Gtk.FileChooserButton folder_chooser;
        public Gtk.Grid grid;

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
            set_keep_above (true);

            var folder_dir = Environment.get_user_special_dir (UserDirectory.PICTURES)
                +  "%c".printf(GLib.Path.DIR_SEPARATOR) + ScreenshotApp.SAVE_FOLDER;
            
            ScreenshotApp.create_dir_if_missing (folder_dir);

            preview_image = new Gtk.Image();

            dialog_label = new Gtk.Label ("Save Screenshot as...");
            name_label = new Gtk.Label ("Name: ");
            name_entry = new Gtk.Entry ();
            name_entry.hexpand = true;
            //name_entry.text = file_name;

            format_label = new Gtk.Label ("Format: ");
            format_combobox = new Gtk.ComboBoxText();
            format_combobox.append_text ("png");
            format_combobox.append_text ("jpeg");
            format_combobox.append_text ("bmp");
            format_combobox.append_text ("pdf");

            web_label = new Gtk.Label ("Upload: ");
            web_combobox = new Gtk.ComboBoxText();
            web_combobox.append_text ("Imgur");
            web_combobox.append_text ("Cloudinary");

            folder_label = new Gtk.Label ("Folder: ");
            folder_chooser = new Gtk.FileChooserButton("Select Screenshots Folder…"), Gtk.FileChooserAction.SELECT_FOLDER); 
            folder_chooser.set_current_folder (folder_dir);


            grid = new Gtk.Grid();
            grid.margin = 6;
            grid.attach(preview_image, 0, 0, 2, 1);
            grid.attach(dialog_label, 0, 1, 2, 1);
            grid.attach(name_label, 0, 2, 1, 1);
            grid.attach(name_entry, 1, 2, 1, 1);
            grid.attach(format_label, 0, 3, 1, 1);
            grid.attach(format_combobox, 1, 3, 1, 1);
            grid.attach(web_label, 0, 4, 1, 1);
            grid.attach(web_combobox, 1, 4, 1, 1);
            grid.attach(folder_label, 0, 5, 1, 1);
            grid.attach(folder_chooser, 1, 5, 1, 1);




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