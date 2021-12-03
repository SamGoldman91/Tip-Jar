Rails.application.routes.draw do



  # Routes for the Tip rating resource:

  # CREATE
  post("/insert_tip_rating", { :controller => "tip_ratings", :action => "create" })
          
  # READ
  get("/tip_ratings", { :controller => "tip_ratings", :action => "index" })
  
  get("/tip_ratings/:path_id", { :controller => "tip_ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_tip_rating/:path_id", { :controller => "tip_ratings", :action => "update" })
  
  # DELETE
  get("/delete_tip_rating/:path_id", { :controller => "tip_ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Vote resource:

  # CREATE
  post("/insert_vote", { :controller => "votes", :action => "create" })
          
  # READ
  get("/votes", { :controller => "votes", :action => "index" })
  
  get("/votes/:path_id", { :controller => "votes", :action => "show" })
  
  # UPDATE
  
  post("/modify_vote/:path_id", { :controller => "votes", :action => "update" })
  
  # DELETE
  get("/delete_vote/:path_id", { :controller => "votes", :action => "destroy" })

  #------------------------------

  # Routes for the Business resource:

  # CREATE
  post("/insert_business", { :controller => "businesses", :action => "create" })
          
  # READ
  get("/businesses", { :controller => "businesses", :action => "index" })
  
  get("/businesses/:path_id", { :controller => "businesses", :action => "show" })
  
  # UPDATE
  
  post("/modify_business/:path_id", { :controller => "businesses", :action => "update" })
  
  # DELETE
  get("/delete_business/:path_id", { :controller => "businesses", :action => "destroy" })

  #------------------------------

  # Routes for the Tip resource:

  # CREATE
  post("/insert_tip", { :controller => "tips", :action => "create" })
          
  # READ
  get("/tips", { :controller => "tips", :action => "index" })
  
  get("/tips/:path_id", { :controller => "tips", :action => "show" })
  
  # UPDATE
  
  post("/modify_tip/:path_id", { :controller => "tips", :action => "update" })
  
  # DELETE
  get("/delete_tip/:path_id", { :controller => "tips", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
