class Question

  attr_reader :text, :variants, :id

  private

  def initialize(text, variants)
    @id = ::Digest::MD5.hexdigest(([text] + variants).join)
    @text = text
    @variants = variants
  end


end
