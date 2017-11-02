return {
  {
    name = "2017-11-01-172400_init_shepherd",
    up = [[
      CREATE TABLE IF NOT EXISTS shepherd
      (
          id SERIAL PRIMARY KEY NOT NULL,
          client_version TEXT,
          endpoint TEXT NOT NULL,
          module TEXT NOT NULL,
          module_version TEXT NOT NULL,
          created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    ]],
    down = [[
      DROP TABLE shepherd;
    ]]
  }
}