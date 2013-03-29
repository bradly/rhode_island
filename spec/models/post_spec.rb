# require 'spec_helper'

# describe Post do
#   it "should create make methods for each state" do
#     post = Post.new
#     post.respond_to?(:make_pending).should be_true
#     post.respond_to?(:make_live).should be_true
#     post.respond_to?(:make_archived).should be_true
#     post.respond_to?(:make_deleted).should be_true
#   end

#   it "should create make bang methods for each state" do
#     post = Post.new
#     post.respond_to?(:make_pending!).should be_true
#     post.respond_to?(:make_live!).should be_true
#     post.respond_to?(:make_archived!).should be_true
#     post.respond_to?(:make_deleted!).should be_true
#   end

#   it "should call before entering callback before changing state" do
#     post = Post.new
#     post.should_receive(:before_making_live) do
#       post.should_receive(:make_live) do
#       end
#     end
#     post.make_live
#   end

#   it "should call before leaving callback before changing state" do
#   end
# end
