<!DOCTYPE html>
<html>
<head>
	<title>Fb Share</title>
	<meta property="og:url"           content="" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="{{$product['title']}} Price:{{$product['price']}} " />
	<meta property="og:description"   content="{{$product['description']}}" />
	<meta property="og:image"         content="{{asset('/')}}/{{$product['photo']}}" />

</head>
<body>
</body>
<div id="fb-root"></div>

<script>
(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.3&appId=219567500152751";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

function fb_share(dynamic_link,dynamic_title) {
    var app_id = '219567500152751';
    console.log(dynamic_link);
    var pageURL="https://www.facebook.com/dialog/feed?app_id=" + app_id + "&link="+dynamic_link;
    var w = 600;
    var h = 400;
    var left = (screen.width / 2) - (w / 2);
    var top = (screen.height / 2) - (h / 2);
    window.open(pageURL, dynamic_title, 'toolbar=no, location=no, directories=no, status=no, menubar=yes, scrollbars=no, resizable=no, copyhistory=no, width=' + 800 + ', height=' + 650 + ', top=' + top + ', left=' + left)
    return false;
}
</script>



</html>
