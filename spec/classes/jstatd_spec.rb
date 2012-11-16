#!/usr/bin/env rspec

require 'spec_helper'

describe 'jstatd' do
  it { should contain_class 'jstatd' }
end
