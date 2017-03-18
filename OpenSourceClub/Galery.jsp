<%@ page import="org.json.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<html>
<head>
	<title>Open Source Club</title>
	<link rel="stylesheet" href="Design\NavBar.css" />
</head>
<body>
<div id="navheader">
<div style="float: center">
		<a class="link" href="/OpenSourceClub">Home</a>
		<a class="link" href="DisplayEvents.jsp">Events & Workshops</a>
		<a class="link" href="Galery.jsp">Gallery</a>
		<a class="link" href="/OpenSourceClub/#footer">About</a>
</div>
</div>
	
<%
try{
			//URL url = new URL("https://github.com/Rohithragav/Club/blob/master/OpenSourceClub/galery.json");	
			URL url = new URL("http://52.33.140.163:8080/OpenSourceClub/data/galery.json");
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

            JSONArray jk = jsonObject.getJSONArray("list");
            int count = 0;
            while(count<jk.length()){
            JSONObject jo = jk.getJSONObject(count);
            String title = jo.getString("title");
            title = title.replace("_"," ");
            %>
			<br>
			<br>
			<div style="width: 80%; margin-left: 40px">
			<h1><%=title%></h1><br>
            <%
            JSONArray jk1 = jo.getJSONArray("imgs");
            for(int i=0 ; i<jk1.length();i++){
            		String imgurl = (String)jk1.get(i);
            		%>
					<img id="galery-card" src="<%=imgurl%>">
            		<%
            	}
            	%></div><%
            	count++;
            }
}
catch (Exception e) {
	%><p><%=e%></p><%
}

%>