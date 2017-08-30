require_relative "../src/car"
require_relative "../src/notifier"

describe Notifier do
  let(:car) {Car.new 2000}

  describe "#log" do
    context "when service is not exceeded" do
      it {expect{car.log 500}.to output("The car has logged 500 miles, totaling 2500 miles traveled.\n").to_stdout}
    end

    context "when service is exceeded" do
      it do
        expect{car.log 1000}
          .to output("The car has logged 1000 miles, totaling 3000 miles traveled.The car needs to be taken in for a service!")
          .to_stdout
      end
    end
  end
end
