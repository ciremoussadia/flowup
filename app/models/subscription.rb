# frozen_string_literal: true

class Subscription < ApplicationRecord
  has_one_attached :song
  validate :song_present
  validates(
    :name,
    :address,
    :age,
    :tel,
    :email, presence: true
  )

  private

  def song_present
    errors.add(:song, 'Un fichier mp3 doit être ajouté.') unless song.attached?
    errors.add(:song, 'Le type de fichier doit être mp3.') unless song_type_audio?
  end

  def song_type_audio?
    song.attachment.audio? if song.attached?
  end
end
