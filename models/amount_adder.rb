class AmountAdder
  def initialize(offer_repo)
    @repo = offer_repo
  end

  def add_amount
    return 0 if @repo.all_active.empty?

    40
  end
end
