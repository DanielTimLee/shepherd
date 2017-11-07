return {
  {
    name = "2016-11-07-172400_init_shepherd",
    up = [[
      CREATE TABLE IF NOT EXISTS shepherd
      (
          id uuid,
          client_version TEXT,
          endpoint TEXT NOT NULL,
          module TEXT NOT NULL,
          module_version TEXT NOT NULL,
          is_active BOOLEAN DEFAULT True NOT NULL,
          created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          PRIMARY KEY (id)
      );
    ]],
    down = [[
      DROP TABLE shepherd;
    ]]
  }
}
