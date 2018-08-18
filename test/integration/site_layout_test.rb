require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links for unauthenticated users' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
  end

  test 'layout links for authenticated users' do
    user = users(:michael)
    log_in_as user
    get root_path
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', users_path
    assert_select 'a[href=?]', "/users/#{user.id}"
    assert_select 'a[href=?]', "/users/#{user.id}/edit"
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
  end
end
