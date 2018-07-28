class AddReferenceToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :fight, index: true
  end
end
