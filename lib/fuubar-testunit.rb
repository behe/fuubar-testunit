require 'test/unit/ui/console/testrunner'
require 'progressbar'

class FuubarRunner < Test::Unit::UI::Console::TestRunner

  def started(test_result)
    @test_result           = test_result
    @example_count         = @mediator.instance_eval { @suite }.size
    @progress_bar          = ProgressBar.new("  #{@example_count} tests", @example_count, @io)
    @progress_bar.bar_mark = '='
  end

  def test_finished(test_case_name)
    output_increment
  end

  def add_fault(fault)
    @state = :red

    output_single "\e[K"

    @faults << fault
    output("%3d) %s" % [@faults.length, fault.long_display])
    nl
    output_increment
  end

  def finished(elapsed_time)
    with_color { @progress_bar.finish }
    nl
    output("Finished in #{elapsed_time} seconds.")
    with_color do
      output @test_result.to_s
    end
  end

  def output_increment
    with_color do
      @progress_bar.instance_variable_set("@title", "  #{@test_result.run_count}/#{@example_count}")
      @progress_bar.inc
    end
  end

  def with_color
    output_single "\e[#{colors[state]}m"
    yield
    output_single "\e[0m"
  end

  def state
    @state ||= :green
  end

  def colors
    { :red => 31, :green => 32, :yellow => 33 }
  end
end

Test::Unit::AutoRunner::RUNNERS[:fuubar] = proc do |r|
  FuubarRunner
end
