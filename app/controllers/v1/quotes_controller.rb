class V1::QuotesController < V1::BaseController
  def show_url
    @quotes = Quote.all
    render json: {status: 'SUCCESS', message: 'Loaded all quotes', quotes: quotes}, status: :ok
  end
end
