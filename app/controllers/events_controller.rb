  # encoding: utf-8
 class EventsController < ApplicationController
   def index
     @events = Event.all
   end

   def import
     Event.import(params[:file])
     redirect_to events_path, notice: "Activity Data imported!"
   end

   def edit
     @event = Event.find(params[:id])
   end

   def update
     @event = Event.find(params[:id])
     if @event.update_attributes(event_params)
       # Handle a successful update.
     else
       render 'edit'
     end
   end

   def destroy
     Event.find(params[:id]).destroy
      flash[:success] = "Event deleted"
      redirect_to events_url
    end

   private

     def event_params
       params.require(:event).permit(:revenue_figure, :total_charge_dj, :charge_flyers,
                                    :charge_others, :number_of_dj, :line_up, :place, :name)
     end
 end
