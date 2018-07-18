require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"

describe List do
  Given(:title) { "To-do" }
  Given(:tasks) { [] }
  Given(:list) { List.new(title) }
  Given(:task) { Task.new("Mow the lawn") }
  Given(:index) { rand(0..5)}

  describe "#initialize" do
    context "takes a title for its first argument" do
      When (:output){List.new(title)}
      Then {expect(output).to be_a_kind_of(List)}
    end

    context "when given no arguments" do 
      Then {expect{List.new}.to raise_error(ArgumentError)} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
  	end

  	context "when given one title argument" do
  	  Then {expect{List.new(title)}.not_to raise_error} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
  	end
  end

  
  describe "#add_task" do
  	context "push task into an array" do
  		When { list.add_task(task) }
  		Then { expect(list.tasks.count).to eq(1) }
  	end

  	
  	context "requires one argument" do 
      Then {expect{List.add_task(task)}.not_to raise_error(ArgumentError)} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
  	end
  end
  

  describe "#complete_task" do
  	
  	context "changes specific task from incomplete to completed" do
  		When { list.add_task(task) } #Only works if tasks [] = empty. 
  		Then { list.tasks[0] == task }
  		Then { task.complete! } #Error of task.complete == true
  	end

  	context "when given one argument" do
  	  Then {expect{List.complete_task(index)}.not_to raise_error(ArgumentError)} 
  	end
  end

  describe "#delete_task" do
  	context "deletes specific task from tasks array" do
  		When { list.tasks[0] == task }
  		Then { list.tasks[0] == nil }
  	end
  end

  describe "#completed_tasks" do
  	context "displays all the completed tasks" do
  		When { list.tasks[0] == task }
  		When { task.complete! }
  		Then { task }

  	end
  end

  describe "#incomplete_tasks" do
  	context "displays all the incomplete tasks" do
  		When { list.tasks[0] == task } #Can refactor?
  		When { task.complete? == false }
  		Then { task }

  	end
  end

end
