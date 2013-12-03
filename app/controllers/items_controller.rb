class ItemsController < ApplicationController
	before_filter :authenticate_user!
  # GET /items
  # GET /items.json
  def index
    #@Zvalue=[]
    #@items = Item.all
    #@items.each do |item|
     #@ZItem=Item.find(item.id)
     #unless @ZItem.zaiko.nil?
     # p @ZItem.zaiko.value
     #@Zvalue.push(@ZItem.zaiko.value)
     #else
     #@Zvalue.push(0)
     #end
    #end
    #@items = Item.all
    sql = "SELECT items.code,items.cost,items.kban,items.name,items.price,items.price2,items.price3,items.price4,items.sho1bun,zaikos.value,items.id,items.user_id FROM items LEFT JOIN zaikos ON items.code = zaikos.code WHERE items.user_id=" + current_user.id.to_s
    @items = Item.find_by_sql(sql)
    respond_to do |format|
    
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
