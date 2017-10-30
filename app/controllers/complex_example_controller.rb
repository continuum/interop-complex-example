class ComplexExampleController < ApplicationController
  def people
    respond_to do |format|
      body = {
        :persona => {
          :nombres => ["Juan", "Andres"],
          :apellidos => ["Perez","Cortez"]
        }
      }
      format.json  { render :json => body } # don't do msg.to_json
    end
  end
end
