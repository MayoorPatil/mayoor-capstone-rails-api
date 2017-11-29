class AssignmentsController < ProtectedController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /assignments
  def index
    @assignments = current_user.assignments.all

    render json: @assignments
  end

  # GET /assignments/1
  def show
    render json: @assignment
  end

  # POST /assignments
  def create
    # @assignment = Assignment.new(assignment_params)
    @assignment = current_user.assignments.build(order_params)

    if @assignment.save
      render json: @assignment, status: :created, location: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assignments/1
  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignments/1
  def destroy
    @assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      # @assignment = Assignment.find(params[:id])
      @assignment = current_user.assignments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assignment_params
      params.require(:assignment).permit(:order_id, :product_id)
    end
end
