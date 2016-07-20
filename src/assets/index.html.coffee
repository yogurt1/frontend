module.exports = """<!DOCTYPE html>
<html lang="ru" #{if production then 'manifest="manifest.appcache"'}>
<head>
  <title>guestbook</title>
  <meta charset="UTF=8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="shortcut icon" href="#{require 'images/favicon.ico'}">
  <style>#{require '!css?minimize!sass!styles/main.sass'}</style>
</head>
<body>
 <div id="root">
   <div class="prerender">
     <h3>Loading...</h3>
       <div class="loader-wrap">
         <div class="loader">
           <!--SVG Animation-->
           <!--Maintance page-->
         </div>
       </div>
     </div>
  </div>
</body>
</html>"""
