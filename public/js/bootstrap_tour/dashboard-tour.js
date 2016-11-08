/* 

 * Product tour

 */

// Instance the tour

var tour = new Tour({

  steps: [

  {

        element: "#menu-toggle",
        title: "Pin/Unpin",
        placement: "right",		
        content: "Pin and Unpin the vertical menu bar.",
        path:"/"+portalloc+"plugin/widget.php?mid=1332&nav=6&prtour=1"
  },
   {

        element: "#prtour_1332",
        title: "1View",
        placement: "right",		
        content: "Access QB reports, Social media notifications and Google search."
   },
   {

        element: "#prtour_1333",
        title: "Social Media",
        placement: "right",		
        content: "View social media activities and statistics."
   },
    {

        element: "#prtour_1335",
        title: "Google Calendar",
        placement: "right",		
        content: "Manage and view your google calendar."
   },
   {

        element: "#prtour_1336",
        title: "Gmail",
        placement: "right",		
        content: "Manage and view your Gmail account.",
        
   },
   {
        element:"#prtour_1338",
        title: "Ecommerce",
        placement: "right",		
        content: "Manage customers orders and transaction of any Ecommerce account."
      
   },
  
   {

        element: "#prtour_profile",
        title: "My profile",
        placement: "right",		
        content: "Set your password, create connections, view account details and Upload a photo."
   },
   {

        element: "#prtour_notification",
        title: "Notifications",
        placement: "right",		
        content: "Broadcasts your notifications for the day."
   },
   {

        element: "#prtour_admin",
        title: "Administrator",
        placement: "bottom",		
        content: "Manage your users,roles and payment details."
   },
   {

        element: "#prtour_theme",
        title: "Theme",
        placement: "bottom",		
        content: "Change the color theme of your site."
   },
   {
        element: "#prtour_goolesearch",
        title: "Google Search",
        placement: "bottom",		
        content: "Custom search google with in your site."
   },
   {
        element: "#prtour_fb",
        title: "Social Connections",
        placement: "right",		
        content: "Click on relevant social icons to add a connection."
   },
   {
        element: "#prtour_tables",
        title: "Financial Reports",
        placement: "top",		
        content: "View your quickbooks data and export in different formats."
   },
   {
        element: "#prtour_trend",
        title: "Trend Analysis",
        placement: "left",		
        content: "Analyze data trends using different charts."
   },
   {
        element: "#prtour_period",
        title: "Period",
        placement: "left",		
        content: "Click To change the trend period."
   },
   {
        element: "#prtour_tasktodo",
        title: "ToDo List",
        placement: "top",		
        content: "Manage your todo list with reminders."
   },
   {
        element: "#prtour_rssfeeds",
        title: "RSS Feeds",
        placement: "top",		
        content: "Add/Delete upto 5 RSS feeds."
   },
    {
        element: "#chatContainer",
        title: "Chat",
        placement: "top",		
        content: "Click here to chat with users of the system."
   },   
   {
        element: "#launcher",
        title: "Help",
        placement: "top",		
        content: "Click to create a support ticket to 1Dash team."
   },
   {
        element: "#prtour_logout",
        title: "Logout",
        placement: "left",		
        content: " Logout from the application.",
        path:"/"+portalloc+"plugin/widget.php?mid=1332&nav=6&prtour=1"
   },
   
    //Profile Page
   {

        element: "#prtour_changePswd",
        title: "Modify Password",
        placement: "top",		
        content: "Reset your password.",
        path:"/"+portalloc+"page/profile.php?mid=1334&nav=12&prtour=1"
   },
   {

        element: "#prtour_aboutme",
        title: "Upload Picture",
        placement: "left",		
        content: "Click to upload your profile picture."
   },
   {

        element: "#prtour_connections",
        title: "Add connections",
        placement: "left",		
        content: "Click to add new connections to your widget (Quickbooks, Gmail, Social media).",
        path:"/"+portalloc+"page/profile.php?mid=1334&nav=12&prtour=1"
   }, 
   
   {
        element: "#prtour_soall",
        title: "Socail",
        placement: "top",		
        content: "Click here to view latest 30 social feeds.",
        path:"/"+portalloc+"module/socialstream.php?mid=1333&nav=6&prtour=1"
   },
   
   //Calender
    {
        element: "#prtour_month",
        title: "Month view",
        placement: "bottom",		
        content: "Click to view the events of current month",
        path : "/"+portalloc+"module/calendar.php?mid=1335&nav=6&prtour=1"
       
   },
   {
        element: "#prtour_week",
        title: "Weekly view",
        placement: "bottom",		
        content: "Click to view the events from current week"
   },
   {
        element: "#prtour_day",
        title: "Daily view",
        placement: "bottom",		
        content: "Click to view today’s events",
        path : "/"+portalloc+"module/calendar.php?mid=1335&nav=6&prtour=1"
   },
   {
        element: "#prtour_fcbutton",
        title: "Navigator",
        placement: "right",		
        content: "Click and navigate through months to view events"
       
   },//Gmail
   {
        element: "#prtour_checkbox",
        title: "Select all",
        placement: "bottom",		
        content: "Selecting this will select all the mails from the list for you to move/delete them",
        path : "/"+portalloc+"module/gmail_up.php?mid=1336&nav=6&labelIds=INBOX&prtour=1" 
  },
  {
        element: "#prtour_compose",
        title: "Create mail",
        placement: "bottom",		
        content: "Click and create a mail to save or send"
  },
  {
        element: "#prtour_refersh",
        title: "Refresh mail box",
        placement: "bottom",		
        content: "Click and refresh your mail box"
  }
  ,
  {
        element: "#prtour_search",
        title: "Mail search",
        placement: "bottom",		
        content: "Click and refresh your mail box"
  }
 ,
  {
        element: "#prtour_navigator",
        title: "Mail navigator",
        placement: "left",		
        content: "Click and view more emails",
        path : "/"+portalloc+"module/gmail_up.php?mid=1336&nav=6&labelIds=INBOX&prtour=1" 
  },
  {
        element: "#loadAllEcommercePlugins",
        title: "Social Connection",
        placement: "left",		
        content: "Click to add any one of Shopify, WooCommerce, BigCommerce, Amazon, eBay account.",
        path : "/"+portalloc+"module/ecommerce.php?mid=1338&nav=6&prtour=1" 
  },
  {
        element: "#customSelection",
        title: "Period",
        placement: "top",		
        content: "Click to change the trend period."
        
  },
  {
        element: "#prtour_customer",
        title: "Customer details",
        placement: "top",		
        content: "Click to view all the customers categorized by any Ecommerce application."
        
  },
  {
        element: "#prtour_order",
        title: "Order Detials",
        placement: "top",		
        content: "Get order detials refunds,transactions and tracking details of shipments.",
        path : "/"+portalloc+"module/ecommerce.php?mid=1338&nav=6&prtour=1" 
        
  }
  
]});


if(user_type === '1')
{
    tour.addSteps([
           {
               element:"#prtour_admin_user",
               title:"Manage users and roles",
               placement: "left",
               content: "Click to add new user and roles",
               path : "/"+portalloc+"page/admin.php?mid=1337&nav=12&prtour=1" 
           },
           {
               element:"#prtour_cancelAccount",
               title:"Cancel account",
               placement: "left",
               content: "Click to Cancel your account 1Dash acccount"
           },
            {
               element:"#prtour_modifyPlan",
               title:"Upgrade Plan",
               placement: "left",
               content: "Modify your current plan or renew your plan"
           },
           {
               element:"#prtour_additionalUser",
               title:"Buy user",
               placement: "left",
               content: "Click and buy additional users"
           },
           {
               element:"#prtour_latestInvoice",
               title:"Invoice",
               placement: "left",
               content: "View your latest invoice"
           }
           
    ]);
}   


//productTour();
function productTour(CSSLOCATION)
{
   
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
           }
        else
        {
             $('head').append('<link rel="stylesheet" type="text/css" href="'+CSSLOCATION+'product_tour_web.css">');
       
        }
             tour.init();
             console.log(tour);
             tour.start(); 
             tour.restart();
   
}
