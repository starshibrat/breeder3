labgtk_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'controllers/apicall.vala', 
  'models/user.vala', 
  'controllers/login_function.vala', 
  'controllers/register_function.vala', 
  'application.vala', 
  'controllers/listponds_function.vala', 
  'models/pond.vala',
  'register_page.vala',
  'dashboard.vala',
  'add_pond_page.vala'
]

posix_dep = meson.get_compiler('vala').find_library('posix')
cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required : false)

labgtk_deps = [
  dependency('gtk4'),
  dependency('libsoup-2.4'),
  dependency('json-glib-1.0'),
  dependency('gee-0.8'),
  dependency('gio-2.0'),
  posix_dep, m_dep
]

labgtk_sources += gnome.compile_resources('labgtk-resources',
  'labgtk.gresource.xml',
  c_name: 'labgtk'
)

executable('labgtk', labgtk_sources,
  dependencies: labgtk_deps,
       install: true,
)
