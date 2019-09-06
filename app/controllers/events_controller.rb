  # encoding: utf-8
 class EventsController < ApplicationController
   def index
     @events = Event.all
   end

   def new
     @event = Event.new(params[:artist])
   end
   def create
     @event = Event.create(event_params)
     @event.save
     redirect_to events_path
   end

   def calendar
     @events = Event.all
   end
   def import
    @event = Event.import(params[:file])
    redirect_to events_path
   end

   def edit
     @event = Event.find(params[:id])
   end
   def show
     @event = Event.find(params[:id])
   end

   def update
       @event = Event.find(params[:id])
       @event.update_attributes(event_params)
       flash[:notice] = "#{@event.name} was successfully updated."
       redirect_to events_path

   end

   def destroy
     Event.find(params[:id]).destroy
     respond_to do |format|
      format.js
      format.html { redirect_to artists_url, notice: 'artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   private

     def event_params
       params.require(:event).permit(:revenue_figure, :total_charge_dj, :charge_flyers,
                                    :charge_others, :number_of_dj, :line_up, :place, :name, :start)
     end
 end
