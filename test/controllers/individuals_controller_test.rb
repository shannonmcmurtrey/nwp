require 'test_helper'

class IndividualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual = individuals(:one)
  end

  test "should get index" do
    get individuals_url
    assert_response :success
  end

  test "should get new" do
    get new_individual_url
    assert_response :success
  end

  test "should create individual" do
    assert_difference('Individual.count') do
      post individuals_url, params: { individual: { DOB: @individual.DOB, address_line_1: @individual.address_line_1, address_line_2: @individual.address_line_2, city: @individual.city, cohort_id: @individual.cohort_id, email_address: @individual.email_address, ethnicity: @individual.ethnicity, ethnicity_other: @individual.ethnicity_other, first_name: @individual.first_name, language_other: @individual.language_other, lanuage_primary: @individual.lanuage_primary, last_name: @individual.last_name, mobile_phone_number: @individual.mobile_phone_number, neighborhood_resident_length_in_months: @individual.neighborhood_resident_length_in_months, non_us_citizen: @individual.non_us_citizen, phone_number: @individual.phone_number, springfield_native: @individual.springfield_native, springfield_native_neighborhood: @individual.springfield_native_neighborhood, springfield_non_native_distance: @individual.springfield_non_native_distance, springfield_non_native_population: @individual.springfield_non_native_population, start_date: @individual.start_date, state: @individual.state, us_citizen: @individual.us_citizen, zip: @individual.zip } }
    end

    assert_redirected_to individual_url(Individual.last)
  end

  test "should show individual" do
    get individual_url(@individual)
    assert_response :success
  end

  test "should get edit" do
    get edit_individual_url(@individual)
    assert_response :success
  end

  test "should update individual" do
    patch individual_url(@individual), params: { individual: { DOB: @individual.DOB, address_line_1: @individual.address_line_1, address_line_2: @individual.address_line_2, city: @individual.city, cohort_id: @individual.cohort_id, email_address: @individual.email_address, ethnicity: @individual.ethnicity, ethnicity_other: @individual.ethnicity_other, first_name: @individual.first_name, language_other: @individual.language_other, lanuage_primary: @individual.lanuage_primary, last_name: @individual.last_name, mobile_phone_number: @individual.mobile_phone_number, neighborhood_resident_length_in_months: @individual.neighborhood_resident_length_in_months, non_us_citizen: @individual.non_us_citizen, phone_number: @individual.phone_number, springfield_native: @individual.springfield_native, springfield_native_neighborhood: @individual.springfield_native_neighborhood, springfield_non_native_distance: @individual.springfield_non_native_distance, springfield_non_native_population: @individual.springfield_non_native_population, start_date: @individual.start_date, state: @individual.state, us_citizen: @individual.us_citizen, zip: @individual.zip } }
    assert_redirected_to individual_url(@individual)
  end

  test "should destroy individual" do
    assert_difference('Individual.count', -1) do
      delete individual_url(@individual)
    end

    assert_redirected_to individuals_url
  end
end
