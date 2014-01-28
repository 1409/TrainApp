test "Trainingsplan can not be saved without name" do
 trainingsplan = Trainingsplan.new
 assert !trainingsplan.save
end