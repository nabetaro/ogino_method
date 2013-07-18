# encoding: utf-8

require 'ogino_method'

describe OginoMethod do

  describe '#fertility' do

    shared_examples_for "次回月経から数えて判定する" do
      it '12〜16日前は高' do
        (12..16).each do |d|
          @ins.fertility(@next-d).should == OginoMethod::HIGH
        end
      end
      it '11日前、17〜19日前は中' do
        @ins.fertility(@next-11).should == OginoMethod::MIDDLE
        (17..19).each do |d|
          @ins.fertility(@next-d).should == OginoMethod::MIDDLE
        end
      end
      it '当日から10日前、20日以前は低' do
        (0..10).each do |d|
          @ins.fertility(@next-d).should == OginoMethod::LOW
        end
        (20..@cycle).each do |d|
          @ins.fertility(@next-d).should == OginoMethod::LOW
        end
      end

    end
    context "周期が28日の場合" do
      before do
        @onset = Date.new(2009,2,1)
        @cycle = 28
        @next = @onset + @cycle
        @ins = OginoMethod.new(@onset, @cycle)
      end
      it_behaves_like "次回月経から数えて判定する"
      context "さらにその次の月経を基準にすると" do
        before do
          @next = @next + @cycle
        end
        it_behaves_like "次回月経から数えて判定する"
      end
    end
    context "周期が32日の場合" do
      before do
        @onset = Date.new(2009,2,1)
        @cycle = 32
        @next = @onset + @cycle
        @ins = OginoMethod.new(@onset, @cycle)
      end
      it_behaves_like "次回月経から数えて判定する"
      context "さらにその次の月経を基準にすると" do
        before do
          @next = @next + @cycle
        end
        it_behaves_like "次回月経から数えて判定する"
      end
    end
  end


end
