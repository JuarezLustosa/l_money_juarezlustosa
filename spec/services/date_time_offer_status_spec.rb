require 'rails_helper'

RSpec.describe DateTimeOfferStatus do
  describe '#call' do
    subject { described_class.call(start_at, ends_at) }

    let(:current_time) { Date.civil(2020, 10, 15) }

    before { allow(Time).to receive(:current).and_return(current_time) }

    context 'when current time is equal than start_at' do
      let(:start_at) { current_time }

      context 'and ends_at is after than current time' do
        let(:ends_at) { current_time - 1.day }

        it { is_expected.to eq(:disabled) }
      end

      context 'and ends_at is before than current time' do
        let(:ends_at) {  current_time + 1.day }

        it { is_expected.to eq(:enabled) }
      end
    end

    context 'when current time is before than start_at' do
      let(:start_at) { current_time + 1.day }

      context 'and greater than ends_at' do
        let(:ends_at) { current_time - 1.day  }

        it { is_expected.to eq(:disabled) }
      end

      context 'when before ends_at' do
        let(:ends_at) {current_time + 1.day }

        it { is_expected.to eq(:disabled) }
      end
    end

    context 'when current time is after than start_at' do
      let(:start_at) { current_time - 1.day }

      context 'and greater than ends_at' do
        let(:ends_at) { current_time - 1.day  }

        it { is_expected.to eq(:disabled) }
      end

      context 'when before ends_at' do
        let(:ends_at) {current_time + 1.day }

        it { is_expected.to eq(:enabled) }
      end
    end

    context 'when ends_at is nil' do
      let(:start_at) { current_time - 1.day }
      let(:ends_at) { nil }

      it { is_expected.to eq(:enabled) }
    end
  end
end
