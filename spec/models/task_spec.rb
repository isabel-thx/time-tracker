# frozen_string_literal: true
require 'rails_helper'

describe Task do
  it { should belong_to :project }

  it { should validate_presence_of  :name }
  it { should validate_presence_of  :date }
  it { should validate_presence_of  :start_time }
  it { should validate_presence_of  :end_time }

  describe "time_validation" do
    let(:task) { Task.new(start_time: Time.now, end_time: 1.hour.ago) }

    context "when end_time is before start_time" do
      it {should_not allow_value(task.start_time < task.end_time).
      for(:start_time)}
    end
  end

  describe "date_validation" do
    let(:task) { Task.new(date: Date.today) }

    context "when date is after today" do
      it {should_not allow_value(Date.today + 1.day).
      for(:date)}
    end
  end
end
