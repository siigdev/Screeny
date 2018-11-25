namespace Screeny {
    public class Application : Gtk.Application {
        public MainWindow window;
        
        public Application () {
            Object (application_id: "com.github.siigdev.screeny",
                flags: ApplicationFlags.FLAGS_NONE);
        }

        protected override void activate () {
            if (window != null) {
                window.present();
                return;
            }
            window = new MainWindow (this);
        }

        public static int main (string[] args) {
            var app = new Screeny.Application ();
            return app.run (args);
        }
    }
}