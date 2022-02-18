require_relative '../french_ssn'

describe "#french_ssn_info" do
  it "return 'The number is invalid' when passed an empty string" do
    result = french_ssn_info("")

    expect(result).to eq("The number is invalid")
  end

  it "returns 'a man, born in December, 1984 in Seine-Maritime.' when passed '1 84 12 76 451 089 46'" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end