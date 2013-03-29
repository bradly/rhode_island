require 'spec_helper'

describe RhodeIsland do
  it "should be a module" do
    RhodeIsland.should be_a Module
  end

  it "should create make methods for each state" do
    post = Post.new
    post.respond_to?(:make_pending).should be_true
    post.respond_to?(:make_live).should be_true
    post.respond_to?(:make_archived).should be_true
    post.respond_to?(:make_deleted).should be_true
  end

  it "should create make bang methods for each state" do
    post = Post.new
    post.respond_to?(:make_pending!).should be_true
    post.respond_to?(:make_live!).should be_true
    post.respond_to?(:make_archived!).should be_true
    post.respond_to?(:make_deleted!).should be_true
  end

  it "should call before entering callback before changing state" do
    post = Post.new
    post.should_receive(:before_making_live) do
      post.should_receive(:state=).with('live')
    end
    post.make_live
  end

  it "should call before leaving callback before changing state" do
    post = Post.new({state: 'live'}, without_protection: true)
    post.should_receive(:before_leaving_live) do
      post.should_receive(:state=).with('deleted')
    end
    post.make_deleted
  end

  it "should call before leaving callback before calling before making callback" do
    post = Post.new({state: 'live'}, without_protection: true)

    post.should_receive(:before_leaving_live) do
      post.should_receive(:before_making_deleted) do
        post.should_receive(:state=).with('deleted')
      end
    end
    post.make_deleted
  end
end
