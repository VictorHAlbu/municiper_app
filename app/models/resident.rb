class Resident < ApplicationRecord
  
  has_one_attached :photo
  
  enum status: { inactive: 0, active: 1 }
  has_enumeration_for :status, with: ResidentEnum::Statuses, create_helpers: true
  has_many :addresses, as: :addressable
  validates :full_name, presence: true, length: { maximum: 255 }
  validates :document, presence: true, cpf: true
  validates :health_card_document, presence: true
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    length: { maximum: 255 }
  validates :birthdate, presence: true
  validates :phone, presence: true
  validates :photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                            size_range: 1..(5.megabytes) }

  validate :birthdate_between_zero_and_125_years_ago
  accepts_nested_attributes_for :addresses
  
  before_validation :cleasing

  private

  def birthdate_between_zero_and_125_years_ago
    return if birthdate.blank?

    errors.add(:birthdate, :invalid) if birthdate > Date.today || birthdate < 125.years.ago
  end

  def cleasing
    self.health_card_document = health_card_document.to_s.gsub(/\D/, '')
  end
end