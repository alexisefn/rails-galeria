# Contador de ID:
# Script que recorre todas tus tablas y ajusta el contador de IDs.
# Después de una importación masiva, PostgreSQL no sabe cuál fue el último ID utilizado,
# por lo que es necesario "reiniciar" los contadores de IDs de cada tabla.

namespace :db do
  desc "Resets the primary key sequence for all tables"
  task reset_pk_sequence!: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1") rescue (puts "No ID column on #{table}"; nil)
      if result.present? && result.first.present?
        ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{result.first['id'].to_i + 1}")
        puts "Reset sequence for #{table}"
      end
    end
  end
end
