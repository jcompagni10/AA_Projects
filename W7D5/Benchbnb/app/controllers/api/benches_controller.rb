class Api::BenchesController < ApplicationController

  def index
    bounds = params[:filters][:bounds] if params[:filters]
    if bounds
      @benches = Bench.in_bounds(bounds)
    else
      @benches = Bench.all
    end
    render :index
  end

  def show
    @bench = Bench.find_by(id: params[:id])
    render :show
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      login(@bench)
    render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  def update
    @bench = Bench.find_by(id: params[:id])
    if @bench && @bench.update(bench_params)
      render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  def destroy
    @bench = Bench.find_by(id: params[:id])
    if @bench
      render :show
    else
      render json: {}, status: 404
    end
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end
end
