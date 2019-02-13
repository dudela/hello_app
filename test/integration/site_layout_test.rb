require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  get root_url
  assert_template 'static_pages/help'
  assert_select "a[href=?]", root_path, count: 2
  assert_select "a[href=?]", help_path
  assert_select "a[href=?]", about_path
  assert_select "a[href=?]", contact_path
end
