class CallController < ApplicationController
  require 'net/http'
  require 'net/https'
  @@items = nil
#  require 'will_paginate/array'
  def index
  #  params = {'box1' => 'Nothing is less important than which fork you use. Etiquette is the science of living. It embraces everything. It is ethics. It is honor. -Emily Post',
  #            'button1' => 'Submit'
  #  }
  #  x = Net::HTTP.get(URI.parse('http://localhost:3000/user/5'))
  #  puts x

    if !@@items.blank?
      @items = @@items
      @items = @items.paginate(:page => params[:page], :per_page => 10)
    else
      @items = nil

    end

  # puts @items


#   Rails.logger.info "yasir"
  end

  def chk
    if request.post?
      if !params[:call][:search].blank?
        Rails.logger.info params[:call][:search]
        #   require 'ebay/ysr'
           @@items =  Ebay::Test.search(params[:call][:search])
        #@items = params[:call][:search]
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

end
