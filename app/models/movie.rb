class Movie < ActiveRecord::Base
	def self.all_ratings
        self.find(:all, :select => "rating", :group => "rating").map(&:rating)
    end
   # def self.short_rating (ctriter_order, criter_short)
    	#logger.info "-----wkst---ctriter_order ["+ ctriter_order. + "]" 
    #     self.where(:rating =>  @ratings.keys )
         #if criter_short.length>0         	
         #	self.where(:rating => [ctriter_order.join(",").to_s]).order("title")
         # else
          #	self.where(:rating => ["#{ctriter_order}"])
         #end
    #end
end
