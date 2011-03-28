class ApiDashboardsController < ApplicationController
  # GET /api_dashboards
  # GET /api_dashboards.xml
  def index
    @api_dashboards = ApiDashboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @api_dashboards }
    end
  end

  # GET /api_dashboards/1
  # GET /api_dashboards/1.xml
  def show
    @api_dashboard = ApiDashboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @api_dashboard }
    end
  end

  # GET /api_dashboards/new
  # GET /api_dashboards/new.xml
  def new
    @api_dashboard = ApiDashboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @api_dashboard }
    end
  end

  # GET /api_dashboards/1/edit
  def edit
    @api_dashboard = ApiDashboard.find(params[:id])
  end

  # POST /api_dashboards
  # POST /api_dashboards.xml
  def create
    @api_dashboard = ApiDashboard.new(params[:api_dashboard])

    respond_to do |format|
      if @api_dashboard.save
        format.html { redirect_to(@api_dashboard, :notice => 'Api dashboard was successfully created.') }
        format.xml  { render :xml => @api_dashboard, :status => :created, :location => @api_dashboard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @api_dashboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /api_dashboards/1
  # PUT /api_dashboards/1.xml
  def update
    @api_dashboard = ApiDashboard.find(params[:id])

    respond_to do |format|
      if @api_dashboard.update_attributes(params[:api_dashboard])
        format.html { redirect_to(@api_dashboard, :notice => 'Api dashboard was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @api_dashboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api_dashboards/1
  # DELETE /api_dashboards/1.xml
  def destroy
    @api_dashboard = ApiDashboard.find(params[:id])
    @api_dashboard.destroy

    respond_to do |format|
      format.html { redirect_to(api_dashboards_url) }
      format.xml  { head :ok }
    end
  end
end
