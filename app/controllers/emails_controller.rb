class EmailsController < ApplicationController
  def index

 if current_user.type == '0'

  @emails = Email.where({:requestor_id=>current_user.id})
 # @emails = Email.all


 else
    @emails = Email.all

    #where({ :supplier_id => '0'})

  end
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new
    @email.objective = params[:objective]
    @email.deadline = Timeliness.parse(params[:deadline], :format => 'mm/dd/yyyy')
    @email.call_to_action = params[:call_to_action]
    @email.email_type = params[:email_type]
    @email.recipient_name = params[:recipient_name]
    @email.requestor_id = current_user.id
    @email.supplier_id = 0

    if @email.save
      redirect_to "/emails", :notice => "Email request created successfully."
    else
      render 'new'
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])

    @email.subject = params[:subject]
    @email.body = params[:body]
   @email.supplier_id = current_user.id

    if @email.save
      redirect_to "/emails", :notice => "Email fulfilled successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @email = Email.find(params[:id])

    @email.destroy

    redirect_to "/emails", :notice => "Email deleted."
  end
end
