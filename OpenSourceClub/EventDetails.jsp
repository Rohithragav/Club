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
		<a class="link" id="back" href="/OpenSourceClub/DisplayEvents.jsp">&#8668;</a>
		<a class="link" href="">Event Details</a>
</div>
</div>
<% String event = (String)request.getParameter("event");
	if (event==null) 
		response.sendRedirect("/OpenSourceClub");

try{
            JSONObject jsonObject = new JSONObject(event);
            String eventname = jsonObject.getString("evenname");
            eventname = eventname.replace("_"," ");
            String fee = jsonObject.getString("fee");
            String date = jsonObject.getString("date");
            date = date.replace("_"," ");
            String image = jsonObject.getString("poster_link");
            String reg = jsonObject.getString("reg_link");
            String desp = jsonObject.getString("description");
            desp = desp.replace("_"," ");
            String venue = jsonObject.getString("venue");
            JSONArray jk = jsonObject.getJSONArray("organiser");
            String orgs1 = (String) jk.get(0);
            	orgs1 = orgs1.replace("_"," ");
            String orgs2 = (String) jk.get(1);
            	orgs2 = orgs2.replace("_"," ");
            jk = jsonObject.getJSONArray("phno");
            String phno1 = (String) jk.get(0);
            String phno2 = (String) jk.get(1);
            

%>
<br>
<br>
<br>
<br><br>
<center>
	<table>
	<tr>
		<td>
			<img src="<%=image%>" align=left width="400px";>
		</td>
		<td>
			
<div style=" margin-left: 40px">
<table style="width: 550px;">
	<tr><td colspan="3"><h1><%=eventname%></h1></td></tr>
	<tr>
		<td colspan="3">
			<p><%=desp%></p>
		</td>
	</tr>
	<tr>
		<td><b>Organizers</b></td>
		<td><b>Venue</b></td>
		<td><b>Fee</b></td>
	</tr>

	<tr>
		<td><%=orgs1%></td>
		<td rowspan="3"><%=venue%></td>
		<td rowspan="3"><%=fee%></td>
	</tr>
	<tr>
		<td><%=phno1%></td>
	</tr>
	<tr>
		<td><%=orgs2%></td>
	</tr>
	<tr>
		<td><%=phno2%></td>
	</tr>
</table>
<br>
<h2>Date : <%=date%></h2>
<a href="<%=reg%>" id="reg">Register</a>
</div>

		</td>
	</tr>
</table>

</center>
<%
}catch (Exception e) {
	%><p><%=e%></p><%
}%>
</body>
</html>