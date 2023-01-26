class Municipality::SupportsController < Municipality::BaseController
  before_action :set_support, only: %i[show edit update destroy]

  def index
    @search_flg = !search_flg.empty? if search_params
    @search_supports_form = SearchSupportsForm.new(search_params)
    @supports = @search_supports_form.search
  end

  def new
    @support = Support.new
  end

  def back
    @support = Support.new(support_params)
    render :new
  end

  def preview
    @support = Support.new(support_params)
    if @support.invalid?
      flash.now[:alert] = '内容を確かめてください。'
      render :new
    end 
  end
  
  def create
    @support = Support.new(support_params)
    @support.save
    redirect_to municipality_support_path(@support), notice: '新規作成しました。'
  end

  def show;end
  def edit;end

  def update
    if @support.update(support_params)
      redirect_to municipality_support_path(@support), notice: '更新しました。'
    else
      flash.now[:alert] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @support.support_tags.destroy
    redirect_to municipality_supports_path, notice: '削除しました。'
  end

  private

  def set_support
    @support = Support.find(params[:id])
  end

  def support_params
    params.require(:support).permit(:support_name, :content, :url, :application_method, :application_limit)
  end

  def search_params
    params[:q]&.permit(:support_name, :tag_id, :state)
  end

  def search_flg
    search_params.values.map {|params|} 
  end
end
