# coding: utf-8
require './lib/qlik_doc'

RSpec.describe QlikDoc, :type => :model do  
  before(:all) do
    @q = QlikDoc.new
    @q.init()
  end

  before(:each) do
    @q.open_doc("#{Dir.pwd}/src/testbed.qvw") 
  end

  it "should set and read a variable named testbed_variable" do
  	@q.set_variable('testbed_variable','successful')
  	expect(@q.get_variable('testbed_variable')).to eq('successful')
  end

  after(:each) do
    @q.close_doc()
  end  

  after(:all) do
    @q.quit()
  end

end