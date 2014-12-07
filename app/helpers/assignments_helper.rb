module AssignmentsHelper
  def score(assign)
    correct = assign.problems.where(completed: true).size
    total = assign.problems.size
    percent = Float(correct) / total * 100

    correct.to_s + " / " + total.to_s + " (" + percent.to_s + "%)"
  end
end
