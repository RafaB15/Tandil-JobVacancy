class OfferCounter
  def initialize(offer_repo)
    @repo = offer_repo
  end

  def count_active
    @repo.all_active.size
  end
end
