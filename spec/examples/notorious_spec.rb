require File.expand_path('../spec_helper', __FILE__)

describe 'Notorious' do

  context 'running the program' do
  end

  context '#ensure_extension' do
    it 'should not change correctly extended files' do
      Notorious.ensure_extension('correct.html', 'html')
               .should == 'correct.html'
    end

    it 'should abide multiple extensions' do
      Notorious.ensure_extension('correct.other.html', 'html')
               .should == 'correct.other.html'
    end

    it 'should add the extension if there is none' do
      Notorious.ensure_extension('wrong', 'txt')
               .should == 'wrong.txt'
    end

    it 'should add the extension if it is wrong' do
      Notorious.ensure_extension('wrong.html', 'erb')
               .should == 'wrong.html.erb'
    end

  end

  context '#validate_extension' do

    it 'should accept correctly extended files' do
      Notorious.validate_extension('correct.html', ['html']).should be_nil
    end

    it 'should abide multiple extensions' do
      Notorious.validate_extension('correct.other.html', ['html']).should be_nil
    end

    it 'should abide multiple extensions' do
      Notorious.validate_extension('correct.other.html', ['html', 'htm']).should be_nil
      Notorious.validate_extension('correct.other.htm', ['html', 'htm']).should be_nil
    end

    it 'should reject no extension' do
      expect {
        Notorious.validate_extension('wrong', ['txt'])
      }.to raise_error
    end

    it 'should reject a wrong extension' do
      expect {
        Notorious.validate_extension('wrong.tx', ['txt'])
      }.to raise_error
    end

    it 'should only care about the last extension' do
      expect {
        Notorious.validate_extension('wrong.html.erb', ['html'])
      }.to raise_error
    end

    it 'should work on multiple extensions' do
      expect {
        Notorious.validate_extension('wrong.html.erb', ['html', 'htm'])
      }.to raise_error
    end
  end

  context 'render' do
    context 'bad input' do

    end
  end



end














