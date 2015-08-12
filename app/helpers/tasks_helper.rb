module TasksHelper

  def check_box_checked?(task)
    task.status == "Completed"
  end

  def no_boxes(task)
    
  end
end
