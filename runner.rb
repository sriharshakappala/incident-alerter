require './services/runner_service'

runner = RunnerService.instance()

runner.add_project('Project A')
runner.add_project('Project B')

runner.add_employee('Employee 1', 'emp1@gmail.com', '111')
runner.add_employee('Employee 2', 'emp2@gmail.com', '222')
runner.add_employee('Employee 3', 'emp3@gmail.com', '333')

runner.assign_project('Project A', 'Employee 1')
runner.assign_project('Project A', 'Employee 2')
runner.assign_project('Project B', 'Employee 2')
runner.assign_project('Project B', 'Employee 3')

runner.set_level('Project A', 'Employee 1', 0)
runner.set_level('Project A', 'Employee 2', 1)
runner.set_level('Project A', 'Employee 3', 0)

runner.unset_level('Project A', 0)
runner.set_level('Project A', 'Employee 2', 3)
runner.set_level('Project A', 'Employee 3', 0)

binding.pry
pp runner.inspect
