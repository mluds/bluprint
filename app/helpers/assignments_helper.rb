module AssignmentsHelper
  def score(assign)
    correct = assign.problems.where(completed: true).size
    total = assign.problems.size

    correct.to_s + " / " + total.to_s
  end
end
