RSpec.describe Operation, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_number) }
    it { is_expected.to validate_presence_of(:second_number) }
    it { is_expected.to validate_presence_of(:operation_type) }
    it do
      is_expected
        .to define_enum_for(:operation_type)
        .with_values(
          plus: 'plus',
          minus: 'minus'
        ).backed_by_column_of_type(:string)
    end
  end
end
