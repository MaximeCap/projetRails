class Utilisateur < ApplicationRecord
	before_save {self.email = email.downcase}

	validates :nom, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i
	validates :email, presence: true, length: { maximum: 244 },
					format: { with: VALID_EMAIL_REGEX },
					uniqueness: {case_sensitive:  false}
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
end