namespace Screenshot.Widgets {
    public class SaveDialog : Gtk.Dialog {
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
    }
}