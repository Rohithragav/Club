<%@ page import="org.json.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%
String title="",date="";
try{
			URL url = new URL("http://localhost:8080/OpenSourceClub/data/events.json");
			HttpURLConnection httpUrlConnection = (HttpURLConnection) url.openConnection();
			InputStream inputStream = httpUrlConnection.getInputStream();
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
			
			StringBuilder stringBuilder = new StringBuilder();
			String parsedString = null;
			while((parsedString=bufferedReader.readLine())!=null){
				stringBuilder.append(parsedString+"\n");
			}
			bufferedReader.close();
			inputStream.close();
			httpUrlConnection.disconnect();
			
			String s= stringBuilder.toString().trim() ;

            JSONObject jsonObject = new JSONObject(s);

            JSONArray jk = jsonObject.getJSONArray("events");
            JSONObject jo = jk.getJSONObject(0);
            title = jo.getString("evenname");
            title = title.replace("_"," ");
            date = jo.getString("date");
            date = date.replace("_"," ");
            }
            catch(Exception e){
%><%=e%><%
        }
            %>
<!DOCTYPE html>
<html>
<head>
	<title>Open Source Club</title>
	<link rel="stylesheet" href="Design\NavBar.css" />
</head>
<body>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<form id="f1" action="DisplayEvents.jsp"></form>
<div id="navheader">
<div style="float: center">
		<a class="link" href="">Home</a>
		<a class="link" href="DisplayEvents.jsp">Events & Workshops</a>
		<a class="link" href="Galery.jsp">Gallery</a>
		<a class="link" href="#footer">About</a>
</div>
</div>
<br>
<br>
<div style="position: absolute;left: 0;right: 0;">
	
<div id="mn">
	<center>
	<table style="width: 80%">
	<tr>
		<td rowspan="2">
			<div>
				<center>
					<table style="width: 90%" >
					<tr>
						<td><img width="75" height="75" src="group.png"></td>
						<td><p id="content">Open Source Club<br> <span style="font-size: 16px;letter-spacing: 5px">At VIT University, Chennai</span></p></td>
					</tr>
					<tr>
						<td colspan="2">
							<h3 id="content" style="color: #fff; font-size: 25px">
								 It is a Student Collaboration for using freely distributed source and the communications infrastructure of the Internet. Our Club boosts 
								 software for which the source code is distributed without charge or limitations on modifications.
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p id="content" style="font-size: 17px; color: #a0b1c5;">We extends this ideology that software's are better when they are free and gives users the freedom to cooperate with each other, to lead an upright life. 
Learning and teaching "the open source way" will better prepare students for their careers, while helping schools differentiate themselves and growing the next generation of open source contributors.</p>
						</td>
					</tr>
				</table>
				</center>
			</div>
		</td>
		<td><div id="logo" style="margin-top: -60px"><img style="width:300px; height:300px" src="club logo.png">
		<br>
		<center><h3 id="text">Started in 2017</h3></center>
		</div></td>
	</tr>
	<tr>
		<td align="center">
			<button id="btn" onclick="location.href='#firstEvent'">See More</button>
		</td>
	</tr>
	</table>
</center>
</div>
<div id="firstEvent">
	<center>
		<table>
		<tr>
			<td>
				<iframe id="inagVideo" width="560" height="315" src="https://www.youtube.com/embed/-dydXEOUHbk" frameborder="0" allowfullscreen></iframe>
			</td>
			<td>
				<div style="padding: 0px 50px;">
					<center >
					<h1 id="content"> #Our Inagural Event</h1>
				<h1 style="color: #e5dfde; font-weight: 800;">The Unbox - Idea  was  our  first event for  inaugural of our club.</h1>
				<p style="color: #a09897"> The event  was an innovative, think tank type of event, which aimed to raise awareness of the importance of bringing out concealed ideas into conversation.</p>

				</center>
				</div>
			</td>
		</tr>
	</table>
	</center>
</div>
<div id="upcoming" onclick="f()">
	<div class="card" >
	<p><sup><div style="width: 10px;height: 10px;background-color: green;border-radius: 50%;"></div> </sup>Up Coming</p>
	
	<H1><%=title%></H1>
	<h3>DATE : <%=date%></h3>
	<p align="right">REGISTER</p>
	</div>
	<br>
	<br>
<hr>
</div>
<div id="footer">
<table style="width: 100%">
	<tr>
		<td><div >
		<center><h1 style="color: #d6d4d4;">#keep contributing with us</h1>
	<p style="color: #d6d4d4;">For Any Feeback</p>
	<a id="mail" href="https://mail.google.com">vitccopensourceclub@gmail.com</a>
	<br>
	<a class="sm" style="color: white;text-decoration: none;" href="_"><h3>{ STAY CONNECTED }</h3></a>
	<div><a class="sm" href="https://www.facebook.com/VitccOpenSourceClub/"><img class="social-media" src="facebook-circular-logo.png"></a>
	<a class="sm" href="https://www.instagram.com/opensourceclubvit"><img class="social-media" src="instagram-logo.png"></a>
	<a class="sm" href=""><img class="social-media" src="twitter-logo-button.png"></a>
	<a class="sm" href="https://mozillatn.github.io/vitccmozilla/"><img class="social-media" src="github-logo.png"></a>
	<a class="sm" href="https://www.youtube.com/channel/UCc5dj0jwEUZON2s1GIAgaig/videos"><img class="social-media" src="youtube-logotype.png"></a>
	</div>
	</center>

	</div></td>

	<td style="width: 30%">
		<div>
	<img  src="vit-logo.png" width="250px">
	<h3>OpenSource is a club under Vit Chennai</h3>

<div class="fb-like" data-href="https://www.facebook.com/VitccOpenSourceClub/" data-width="200px" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
	</div>
	</td>
	</tr>
</table>
<br>
<br>
</div>
<center><p style="letter-spacing: 4px">SOURCE THAT IS OPEN FOR ALL</p>
&#8700;
</center>
</div>
<script type="text/javascript">
	function f() {
		document.getElementById('f1').submit();
	}
</script>
</body>
</html>