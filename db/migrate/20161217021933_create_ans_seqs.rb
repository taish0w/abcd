class CreateAnsSeqs < ActiveRecord::Migration[5.0]
  def change
    create_table :ans_seqs do |t|
      t.integer :ansnum
      t.string :status
      t.timestamp :ans_time

      t.timestamps
    end
  end
end
