class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.string :nombre
      t.string :tiempo
      t.string :tipo
      t.string :descripcion

      t.timestamps
    end
  end
end
