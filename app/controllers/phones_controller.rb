class PhonesController < ApplicationController
    before_action :set_phones, only: %i[ show create update destroy ]

    # DELETE /contacto/1/phones
    def destroy
        phone = Phone.find(phone_params[:id])
        phone.destroy
    end

    # POST /contacto/1/phone
    def create
        @contact.phones << Phone.new(phone_params)

        if @contact.save
            render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

     # PATCH /contacto/1/phone
     def update
        phone = Phone.find(phone_params[:id])
        if phone.update(phone_params)
            render json: @contact.phones
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end
    
    
    # GET /contacto/1/phones
    def show
        render json: @contact.phones
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_phones
       @contact  = Contact.find(params[:contact_id])
     end

    def phone_params
     ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end


  end