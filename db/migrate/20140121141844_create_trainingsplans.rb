class CreateTrainingsplans < ActiveRecord::Migration
  def change
    create_table :trainingsplans do |t|
      t.string :uebung
      t.integer :saetze
      t.integer :wiederholungen
      t.boolean :abgeschlossen

      t.timestamps
    end
  end
end
