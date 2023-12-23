lab1_sources = [
  'main.vala','document.vala', 'content.vala','any.vala',
  'type.vala', 'metadata.vala', 'ioutil.vala', 'util.vala',
  'error.vala', 'struct/node.vala', 'struct/nodes.vala'
]

cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required : false)
posix_dep = meson.get_compiler('vala').find_library('posix')

lab1_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
  dependency('gee-0.8'),
  m_dep,
  posix_dep,
]

executable('lab1', lab1_sources,
  vala_args: '--target-glib=2.58',  dependencies: lab1_deps,
  install: true,
)

