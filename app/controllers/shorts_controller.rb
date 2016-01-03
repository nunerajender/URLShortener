class ShortsController < ApplicationController

	def new
		@short = Short.new

		respond_to do |format|
		format.html 
		end

	end

  def create
    @short = Short.new(params[:short])

    respond_to do |format|
    if @short.save
    format.html { render action: "show" } 
    else
    format.html { render action: "new" }
    end
    end

  end

  def show
    @short = Short.find(params[:id].to_i(36))

    respond_to do |format|
    format.html { redirect_to @short.long }
    end
  end
 
end
