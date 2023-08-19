extends GutTest

var command:Command
var history:Array

func before_each():
  command = Command.new()
  command.animation = "Test"
  command.input_sequence = ["down", "right", "strike"]

func test_check_input_requires_last_input_match():
  var input_history := [["down"], ["right"], ["strike"], ["down"]]
  assert_false(command.check_input(input_history), "should not match if strike is not final input")
  
func test_check_input_accepts_sequence():
  var input_history := [["down"], ["right"], ["strike"]]
  assert_true(command.check_input(input_history), "should work on exact match")
  
func test_check_input_allows_extra_inputs():
  var input_history := [["down"], ["down"], ["down", "right"], [], ["right"], ["right", "strike"]]
  assert_true(command.check_input(input_history), "should work when it's dirty")
  
func test_check_input_obeys_lookahead():
  command.lookahead = 3
  var input_history := [["down"], [], [], ["right"], [], ["strike"]]
  assert_true(command.check_input(input_history), "should work when it's within lookahead")
  
  input_history = [["down"], [], [], [], ["right"], ["strike"]]
  assert_false(command.check_input(input_history), "should not work when it's not within lookahead")
