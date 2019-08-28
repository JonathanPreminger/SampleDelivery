class DjsetvalidatesController<ApplicationController

  def create

  end

private

def djsetvalidates_params
  params.require(:djsetvalidate).permit(:valid, :parent)
end
end
