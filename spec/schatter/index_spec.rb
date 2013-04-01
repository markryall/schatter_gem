require_relative '../spec_helper'
require 'schatter/index'

describe Schatter::Index do
  include Schatter::Index

  it 'should translate to string' do
    to_index(123).must_equal 'bcd'
  end

  it 'should translate to string' do
    from_index('bcd').must_equal 123
  end
end