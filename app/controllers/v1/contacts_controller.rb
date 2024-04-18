class V1::ContactsController < ApplicationController
    def index
        contacts = Contact.all
        render json: contacts, status: :ok
    end
    def create
        contact = Contact.new(contact_params)
        if contact.save
            render json: contact, status: :created
        else
            render json: contact.errors, status: :unprocessable_entity
        end
    end
    def destroy
        contact = Contact.find(params[:id])
        contact.destroy
        if contact.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end

    private
    def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email)
    end
end
