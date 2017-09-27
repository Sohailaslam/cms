class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy], except: [:export]
  before_action :set_event

  # GET /visitors
  # GET /visitors.json
  def index
    @visitors = Visitor.search(params[:user_id])
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = @event.visitor.new
    @products = Product.all.map(&:name)
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = @event.visitor.new(visitor_params)
    @visitor.user_id = current_user.id
    respond_to do |format|
      if @visitor.save
        @products = params[:products]
        @products.each do |product|
          
          Interest.create(product_id: Product.find_by(name: product).id,visitor_id: @visitor.id)
          
        end
        VisitorMailer.welcome_email(@visitor).deliver_now
        format.html { redirect_to new_event_visitor_path(@event), notice: 'Visitor was successfully created.' }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to event_visitors_path(@event), notice: 'Visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to event_visitors_path(@event), notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["Name","Filled By","Event","Company","Designation","Contact No","Email","Notes","Products"]
      @visitors=Visitor.where(event_id: params[:event_id])
      @event=Event.find(params[:event_id]).name
      @visitors.each do |dp|
        sheet.add_row [dp.name,User.find(dp.user_id).name,@event,dp.company,dp.designation,dp.contact_number,dp.email,dp.notes,dp.products.map(&:name)]
      end
    end
    send_data package.to_stream.read, :filename => "VisitorsFor#{@event}.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:name, :user_id,:event_id,:company, :designation, :contact_number, :email, :notes,:products => [])
    end
end
