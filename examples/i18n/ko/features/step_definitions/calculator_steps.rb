begin
  require 'rspec/expectations'
rescue LoadError
  require 'spec/expectations'
end

require 'cucumber/formatter/unicode'
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../../lib")
require 'calculator'

Before do
  @calc = Calculator.new
end

After do
end

Given(/^계산기에 (.*)을 입력했음$/) do |n|
  @calc.push n.to_i
end

When(/^내가 (.*)를 누르면$/) do |op|
  @result = @calc.send op
end

Then(/^화면에 출력된 결과는 (.*)이다$/) do |result|
  expect(@result).to eq(result.to_f)
end
