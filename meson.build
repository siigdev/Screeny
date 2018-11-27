project('com.github.siigdev.screeny', 'vala', 'c')

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/MainWindow.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install: true
)

install_data(
    join_paths('data', meson.project_name() + '.desktop'),
    install_dir: join_paths(get_option('datadir'), 'applications')
)
install_data(
    join_paths('data', meson.project_name() + '.AppData.xml'),
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)