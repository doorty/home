class CareFinder
  include HTTParty
  base_uri 'carefinder-dev.cloudapp.net/carefinder.svc'

  # PDF p14
  def doctors(options={})
    options.merge!({
      :p => 1,
      :lat => 41.6005448,
      :lng => -93.60910639999997,
      :r => 10,
      :if => 1,
      :n => 'P0HI0WY9J5',
      :sv => 'dist',
      :o => 'asc',
      :ps => 10,
      #:ln => 'b', # partial last name
      #:fn => '' # partial first name
    })
    self.class.get("/providersnearlocation", :query => options)
  end
  
  # PDF p11
  def doctors_count(options={})
    options.merge!({
      :lat => 41.6005448,
      :lng => -93.60910639999997,
      :r => 10,
      :if => 1,
      :n => 'P0HI0WY9J5',
      #:ln => 'b', # partial last name
      #:fn => '' # partial first name
    })
    self.class.get("/providersnearlocationcount", :query => options)
  end
  
  # PDF p22
  def doctor_details(options={})
    options.merge!({
      #:id => 41.6005448,
      #:addressid => -93.60910639999997,
    })
    self.class.get("/providerdetails", :query => options)
  end
  
  # PDF p35
  def doctor_similar_names(options={})
    options.merge!({
      :searchcolumn => 'ln',
      :institutionflag => 1,
      :lat => 41.6005448,
      :lng => -93.60910639999997,
      :r => 10,
      #:name => 'Jensen'
    })
    self.class.get("/similarnames", :query => options)
  end
  
  # PDF 56
  def doctor_reviews(options={})
    options.merge!({
      :predicateType => 'Doctor',
      :orderBy => 'newtoold',
      :page => 1,
      :pageSize => 10,
      #:predicateToken => '78123%7C%7C640%7CIA1P%7C01'
    })
    self.class.get("/reviews", :query => options)
  end
  
  # PDF 55
  def doctor_reviews_count(options={})
    options.merge!({
      :predicateType => 'Doctor',
      #:predicateToken => '78123%7C%7C640%7CIA1P%7C01',
    })
    self.class.get("/reviewscount", :query => options)
  end
  
end


class CareFinderController < ApplicationController

  #http://wearestac.com/blog/raising-and-rescuing-custom-errors-in-rails
  #http://stackoverflow.com/questions/8891161/rails-proxy-controller-not-pulling-images-through-properly-how-to-modify-approp
  #http://thinkingeek.com/2011/03/09/create-your-own-jsonp-proxy-using-ruby-on-rails/

  def doctors
    respond_to do |format|
      msg = CareFinder.new.doctors({ln:params["ln"], fn:params["fn"]})
      format.json  { render :json => msg }
    end
  end
  
  def doctors_count
    respond_to do |format|
      msg = CareFinder.new.doctors_count({ln:params["name"]})
      format.json  { render :json => msg }
    end
  end
  
  def doctor_details
    respond_to do |format|
      msg = CareFinder.new.doctor_details({id:params["doctorid"], addressid:params["addressid"]})
      format.json  { render :json => msg }
    end
  end
  
  def doctor_similar_names
    respond_to do |format|
      msg = CareFinder.new.doctor_similar_names({name:params["name"]})
      format.json  { render :json => msg }
    end
  end

  def doctor_reviews
    respond_to do |format|
      msg = CareFinder.new.doctor_reviews({predicateToken:params["token"]})
      format.json  { render :json => msg }
    end
  end
  
  def doctor_reviews_count
    respond_to do |format|
      msg = CareFinder.new.doctor_reviews_count({predicateToken:params["token"]})
      format.json  { render :json => msg }
    end
  end

end
