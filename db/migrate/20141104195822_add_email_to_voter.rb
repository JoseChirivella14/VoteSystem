class AddEmailToVoter < ActiveRecord::Migration
  def change
    add_column :voters, :email, :string
  end
end
