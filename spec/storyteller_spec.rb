# frozen_string_literal: true
#
# To start
# start(StartNotification)
# Once per example group
# example_group_started(GroupNotification)
#
# Once per example
# example_started(ExampleNotification)
#
# One of these per example, depending on outcome
# example_passed(ExampleNotification)
# example_failed(FailedExampleNotification)
# example_pending(ExampleNotification)
#
# Optionally at any time
# message(MessageNotification)
#
# At the end of the suite
# stop(ExamplesNotification)
# start_dump(NullNotification)
# dump_pending(ExamplesNotification)
# dump_failures(ExamplesNotification)
# dump_summary(SummaryNotification)
# seed(SeedNotification)
# close(NullNotification)

# RSpec::Core::Formatters.register FormatterClassName, :example_passed, :example_failed
RSpec.describe Storyteller do
  let(:output) { StringIO.new }
  let(:msg) { "hi" }
  let(:message_notification) { RSpec::Core::Notifications::MessageNotification.new(message: msg) }
  # next:
  let(:example_notification) { RSpec::Core::Notifications::ExampleNotification.for(example: "exx...") }

  subject do
    Storyteller::Formatter.new(output)
  end

  pending ":example_passed" do
    it "can send description to ouput" do
      subject.example_passed(example_notification)
    end
  end

  context ":message" do
    it "it can send a message to the output" do
      subject.message(message_notification)
      expect(output.string).to eql(msg+"\n")
    end
  end
end
