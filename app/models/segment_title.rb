class SegmentTitle < ApplicationRecord
  belongs_to :work_space
  belongs_to :user

  enum segment: [:top,
              :next,
              :not_important,
              :other]

  validates_presence_of :name

  # work_spaceに紐づくものがあればそれ独自文言として利用する
  # userに紐づくものは全ワークスペースのデフォルトとして利用する
  # どちらに紐づくものもない場合はサービスとして用意した文言を利用する
  def self.get_title(work_space, segment)
    segment_symbol = SegmentTitle.segment_symbolize(segment)
    SegmentTitle.custom_title(work_space, segment_symbol) || SegmentTitle.user_default_title(work_space, segment_symbol) || SegmentTitle.service_default_title(segment_symbol)
  end

  def self.custom_title(work_space, segment)
    work_space.segment_titles.find_by(segment: SegmentTitle.segments[segment])
  end

  def self.user_default_title(work_space, segment)
    work_space.user.segment_titles.find_by(segment: SegmentTitle.segments[segment])
  end

  def self.service_default_title(segment)
    name_hash = { top:           'top',
                  next:          'next',
                  not_important: 'not_important',
                  other:         'other' }
    SegmentTitle.new(name: name_hash[segment])
  end
  
  def self.segment_symbolize(int_segment)
    segment_symbol = ""

    case int_segment
    when 0
      segment_symbol = :top
    when 1
      segment_symbol = :next
    when 2
      segment_symbol = :not_important
    when 3
      segment_symbol = :other
    end

    return segment_symbol
  end
end
