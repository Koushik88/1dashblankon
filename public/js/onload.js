
//session validation
 var listen = setInterval(function()
        {
            var loggedIn = getCookie('_loggedIn');
            var redirectUri = "logout";
            if(loggedIn !== null)
            {
               var currentdate = new Date().getTime().toString().substring(0, 10);
               var diff = currentdate - loggedIn;   
               if(diff > 1740)
               {                    
                 clearInterval(listen);
                   var r = confirm('Session Expired - Please login to continue?');
                        if (r === true)
                        {
                            document.location = redirectUri;
                        }
                        else
                        {
                            document.location = redirectUri;
                        }
                   
               }
            }

        },3000);


        function getCookie(name)
        {
                var search_cookie = name + "=";
                offset = document.cookie.indexOf(search_cookie);

                if (document.cookie.length > 0 && offset !== -1)
                {
                         //Search for a cookie.

                        if (offset !== -1)
                        {
                            offset += search_cookie.length;

                            // set index of beginning of value
                            end = document.cookie.indexOf(";",offset);

                            return decodeURIComponent(document.cookie.substring(offset, end));
                        }



                }
                else
                {
                  return null;
                }

        } 

        
