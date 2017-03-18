<%@ page import="org.json.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<html>
<head>
	<title>Open Source Club</title>
	<link rel="stylesheet" href="Design\NavBar.css" />
	<link rel="stylesheet" type="text/css" href="Design\Events.css">
</head>
<body>
<div id="navheader">
<div style="float: center">
		<a class="link" href="/OpenSourceClub">Home</a>
		<a class="link" id="hi" href="">Events & Workshops</a>
		<a class="link" href="Galery.jsp">Gallery</a>
		<a class="link" href="">About</a>
</div>
</div>
<img align="right" style="margin: 80px;" src="calendar.png">
<br>
<br>
<br>

<form id="form1" action="EventDetails.jsp" method="POST"><input type="hidden" id="event" name="event"></form>
<%
	try{
			URL url = new URL("http://52.33.140.163:8080/OpenSourceClub/data/events.json");
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

            int count = 0 ;
			while(count<jk.length()){
				JSONObject jo1 = jk.getJSONObject(count);
				String title = jo1.getString("evenname");
				title = title.replace("_"," ");
				String venue = jo1.getString("venue");
				String fee = jo1.getString("fee");
				String date = jo1.getString("date");
				date = date.replace("_"," ");
				String addr = jo1.getString("reg_link");
				//JSONArray jk1 = jo1.getJSONArray("phno");
				//String phn1 = (String)jk1.get(0);
				//String phn2 = (String)jk1.get(1);
				String full_details = jo1.toString();
				%>
			
	<div style="margin-top: 30px" onclick=reg('<%=full_details%>')>
		<table class="events" >
			<tr>
				<td colspan="3"><h1 id="title"><%=title%></h1></td>
			</tr>
			<tr>
				<td>FEE : <%=fee%></td>
				<td>VENUE : <%=venue%></td>
				<td><img src="calendar small.png" height="20px"> <%=date%></td>
				<td align="right"><a href="<%=addr%>" id="reg">Register</a></td>
			</tr>
			<tr>
				<td colspan="3">see more details</td>
			</tr>
		</table>
	</div>
				<%
				count++;
			}


        } catch (Exception e) {
			%><p><%=e%></p><%
            }
%>
<script type="text/javascript">
	document.getElementById('hi').style.backgroundColor="#009688";
	document.getElementById('hi').style.color=white;

	function reg(arg) {
		document.getElementById("event").value=arg;
		document.getElementById("form1").submit();
	}
</script>
</body>
</html>
