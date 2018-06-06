require 'pg'

def setup_test_database!
    p 'setting up a database'

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec('TRUNCATE bookmarks;')

end
