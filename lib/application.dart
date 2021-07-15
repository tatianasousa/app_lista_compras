

Map<String, int> unity = Map.from({'Un': 0, 'Kg': 3});

String dbName = 'listacompras.db';
int dbVersion = 1;

List<String> dbCreate = [
  // tb lista
  """CREATE TABLE lista (
    pk_lista INTEGER PRIMARY KEY,
    name TEXT,
    created TEXT
  )""",

  // tb Item
  """CREATE TABLE item (
    pk_item INTEGER PRIMARY KEY,
    fk_lista INTEGER,
    name TEXT,
    quantidade DECIMAL(10, 3),
    precisao INTEGER DEFAULT 0,
    valor DECIMAL(10,2),
    checked INTEGER DEFAULT 0,
    created TEXT
  )"""
];

