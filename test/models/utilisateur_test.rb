require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase
  def setup
    @utilisateur = Utilisateur.new(nom: 'example', email: 'user@email.com', 
      password: "exemple", password_confirmation: "exemple")
  end

  test 'should be valid' do
    assert @utilisateur.valid?
  end

  test 'name should be present' do
    @utilisateur.nom = '    '
    assert_not @utilisateur.valid?
  end

  test 'email should be present' do
    @utilisateur.email = '     '
    assert_not @utilisateur.valid?
  end

  test 'name should not be too long' do
    @utilisateur.nom = 'a' * 51
    assert_not @utilisateur.valid?
  end

  test 'email should be not be too long' do
    @utilisateur.email = 'a' * 244 + '@exemple.com'
    assert_not @utilisateur.valid?
  end

  test 'email should accept valid address' do
    addresses_valid = %w[maxcap@ouioui.com chlo@nono.be hoho@hihi.com]
    addresses_valid.each do |adress|
      @utilisateur.email = adress
      assert @utilisateur.valid?, "#{adress.inspect} doit être valide"
    end
  end

  test 'email should reject valid address' do
    addresses_not_valid = %w[maxcap@oui+ouicom chlo_nono.be hoho,hi_hi.]
    addresses_not_valid.each do |adress|
      @utilisateur.email = adress
      assert_not @utilisateur.valid?, "#{adress.inspect} doit être valide"
    end
  end
  
  test 'email should be unique' do
    user_duplique = @utilisateur.dup
    user_duplique.email = @utilisateur.email.upcase
    @utilisateur.save
    assert_not user_duplique.valid?
  end

  test 'password should be present' do
    @utilisateur.password = @utilisateur.password_confirmation = 'a' * 6
    assert @utilisateur.valid?
  end

  test 'password should not be less than 6 character' do
    @utilisateur.password = @utilisateur.password_confirmation = 'a' * 5
    assert_not @utilisateur.valid?
  end
end
