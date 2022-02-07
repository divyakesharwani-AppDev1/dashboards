class CurrenciesController < ApplicationController

  def first_currency

    #require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read #return string with content of the page.
    @parsed_data = JSON.parse(@raw_data)  #to parse the data in orgaznized hash  and good stuffs. 
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys
    
    render({:template=> "currency_templates/step_one.html.erb"})
  
  end

  def conversion

    #Parameters: {"the_currency"=>"AED"}
    @from_currency = params.fetch("the_currency")
    @raw_data = open("https://api.exchangerate.host/symbols").read #return string with content of the page.
    @parsed_data = JSON.parse(@raw_data)  #to parse the data in orgaznized hash  and good stuffs. 
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    render({:template=>"currency_templates/step_two.html.erb"})
  end


end