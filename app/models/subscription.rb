class Subscription < ApplicationRecord

  has_one_attached :song
  validate :song_present
  validates_presence_of(
    :name,
    :address,
    :age,
    :tel,
    :email
  )

  private

  def song_present
    if song.attached? == false
      errors.add(:song, 'Un fichier mp3 doit être ajouté.')
    end

    if(song.attached? && !song.attachment.audio?)
      errors.add(:song, 'Le type de fichier doit être mp3.')
    end
  end
end
