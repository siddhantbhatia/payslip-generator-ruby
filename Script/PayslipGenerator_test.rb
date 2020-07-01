require "minitest/autorun"
require_relative "./PayslipGenerator"

class PayslipGeneratorTest < Minitest::Test
    def test_compute_tax
        # boundary <= 20000
        assert_equal 0, PayslipGenerator.compute_tax(15000), "Tax should be 0"
        assert_equal 0, PayslipGenerator.compute_tax(20000), "Tax should be 0"

        # boundary 20001-40000
        assert_equal 0.1, PayslipGenerator.compute_tax(20001), "Tax should be 0.1"
        assert_equal 2000, PayslipGenerator.compute_tax(40000), "Tax should be 2000"
        assert_equal 1654, PayslipGenerator.compute_tax(36540), "Tax should be 1654"

        # boundary 40001-80000
        assert_equal 2000.20, PayslipGenerator.compute_tax(40001), "Tax should be 2000.20"
        assert_equal 10000, PayslipGenerator.compute_tax(80000), "Tax should be 10000"
        assert_equal 6000, PayslipGenerator.compute_tax(60000), "Tax should be 6000"

        # boundary 80001-180000
        assert_equal 10000.30, PayslipGenerator.compute_tax(80001), "Tax should be 10000.30"
        assert_equal 40000, PayslipGenerator.compute_tax(180000), "Tax should be 40000"
        assert_equal 23036.8, PayslipGenerator.compute_tax(123456), "Tax should be 23036.8"

        # boundary >= 180001 
        assert_equal 40000.40, PayslipGenerator.compute_tax(180001), "Tax should be 40000.40"
        assert_equal 48000, PayslipGenerator.compute_tax(200000), "Tax should be 48000"
        assert_equal 110060, PayslipGenerator.compute_tax(355150), "Tax should be 110060"
    end
end