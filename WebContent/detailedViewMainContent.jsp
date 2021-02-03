<%@page import="models.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.PWA"%>
<%@page import="db.PWATable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<div style="height:100%; width:100%;overflow-y:auto;margin-left:50px">
	
	<%
		//out.println("<h1>"+request.getContextPath()+"</h1>");
		PWA pwa = (PWA)request.getAttribute("pwa");
		//out.println("<h1>"+pwa.getName()+"</h1>");
	%>
	<div class="row">
		<div class="col s12">
		
			<div class ="row">
	<br>
		<div class="col l1">
		<%
			out.println("<img src='"+request.getContextPath()+"/samplePics/"+pwa.getPwaId()+"-logo.png'style='width:250px;height: 250px; box-shadow: 10px 10px 50px rgb(0,0,0,0.1); border-radius: .7em; object-fit: cover;'>");
		%></div>
		<div class="col l2">
		<%
			out.println("<h3 style='padding-left:200px;font-size:300%;width:800px'>"+pwa.getName()+"</h3>");
			//out.println("<p style='font-size:100%;padding-left:70px'>Owner");
		%>

		
		<%
			if(session.getAttribute("username")!=null && session.getAttribute("username").equals(pwa.getUserName()))
				out.println("<p style=\"font-size:100%;padding-left:220px;width:500px\">Owner<i class=\"material-icons\">admin_panel_settings</i></p>");
		%>
					

		<br>
		<div class="row"style="padding-left:220px;width:700px">
		
		<%
			for(int j=1; j<=5; j++){
				if(j<=(int)request.getAttribute("rating"))
					out.println("<i style=\"color:#ffc61a\"class=\"material-icons\">star_rate</i>");
				else
					out.println("<i style=\" color:grey; \" class=\"material-icons\">star_rate</i>");
			}
		%>
		
		</div>
		<%

			out.println("<p style='font-size:160%; display:flex; padding-left:220px'>"+pwa.getViews());
		%>
		<i style="margin-left:10px;"class="material-icons">visibility</i>
		</p>

		</div></div>
		
		
		</div>
		
		<div class="col s12">
			<div>
				<h4>Description:</h4>
				<%
					out.println("<p style='padding-left:25px; width:700px; text-align: justify;'>"+pwa.getDescription()+"</p>");
					//HttpSession session= request.getSession(true);
					//out.println(session.getAttribute("username"));
				%>
			</div>
		</div>
		
		<div class="col s12">
			<div>
				<h4>Sample Pics</h4>
			</div>
			<div style="overflow-x: auto;height:400px; width:700px;display:flex; align-items: center;">
				
					<%
					//out.println("<div class='col s3'>");
					//out.println("<img src='"+request.getContextPath()+"/samplePics/"+pwa.getPwaId()+"-1.png'style='width:400px;height:400px'");
					//out.println("</div>");	
					for(int i=1;i<=pwa.getSamplePicsCount();i++){
						out.println("<div style='height:300px;min-width:200px; max-width:200px; margin:0 .6em; '>");
						out.println("<img src='"+request.getContextPath()+"/samplePics/"+pwa.getPwaId()+"-"+i+".png'style='width:100%; height:100%; object-fit: cover; border-radius: .5em;box-shadow: 10px 10px 30px rgb(0,0,0,0.2);'>");
						out.println("</div>");						
						}
					%>
				
			</div>
		</div>
		
		
		<div class="col s12">
			<div>
				<h4>Reviews</h4>
			</div>
			

			<%
				if(session.getAttribute("username")!=null)
					out.println("<div style=\"display: flex; padding: 0 0 0 6.8em;\">");
				else	
					out.println("<div style=\"display: none; padding: 0 0 0 6.8em;\">");
			%>
			
				<p style="font-weight: bold;    margin: .2em 1em 0 0;"> Rate This PWA</p>
				<div class="userRating">
					<i id="star-1" class="material-icons">star_rate</i>
					<i id="star-2" class="material-icons">star_rate</i>
					<i id="star-3" class="material-icons">star_rate</i>
					<i id="star-4" class="material-icons">star_rate</i>
					<i id="star-5" class="material-icons">star_rate</i>
				</div>
			</div>	
			
			<div style="width:100%; height: fit-content; background-color: pin; display: flex; flex-direction: column;">
				
				
				<%
					ArrayList<Review> reviews = (ArrayList<Review>)request.getAttribute("reviews");
					for(int i=0; i<reviews.size(); i++){
						Review review = reviews.get(i);
						
						out.println("<div class=\"reviewContainer\">");
						out.println("<div class=\"reviewUserPicContainer\"><img alt=\"\" src=\"/PWAs/images/user.png\"></div>");
						out.println("<div class=\"reviewContent\">");
						out.println("<div class=\"reviewUserName\">"+review.getUsername()+"</div>");
						out.println("<div>");
						out.println("<div class=\"reviewRating\">");
						
						for(int j=1; j<=5; j++){
							if(j<=review.getRating())
								out.println("<i style=\"color:#ffc61a\"class=\"material-icons\">star_rate</i>");
							else
								out.println("<i class=\"material-icons\">star_rate</i>");
						}
						
						out.println("</div>");
						out.println("</div>");
						out.println("<div class=\"reviewMessage\">"+review.getMessage()+"</div>");
						out.println("</div>");
						out.println("</div>");
						
					}
				%>
				<!-- 
				<div class="reviewContainer">
					<div class="reviewUserPicContainer"><img alt="" src="/PWAs/images/user.png"></div>
					<div class="reviewContent">
						<div class="reviewUserName">Vivek</div>
						<div>
							<div class="reviewRating">
								<i style="color:#ffc61a"class="material-icons">star_rate</i>
								<i class="material-icons">star_rate</i>
								<i class="material-icons">star_rate</i>
								<i class="material-icons">star_rate</i>
								<i class="material-icons">star_rate</i>
							</div>
						</div>
						
						<div class="reviewMessage">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus sed dui consequat eget nunc. Auctor amet suspendisse ultricies sit ac ac. Fermentum nam at scelerisque quis viverra neque, erat enim. Sed et at consectetur pellentesque. At tellus blandit urna risus nibh fermentum. Dictumst nibh vulputate pellentesque magna.</div>
					</div>
				</div>
				 -->
				
				
			</div>
		</div>
	</div>
	
</div>

<div style="display: none;" class="ratingPopOuterContainer">
	<div class="ratingCard"> 
		<h4>Review</h4>
		<div style="display: flex; flex-direction:column; adding: 0 0 0 6.8em;">
			<p style="font-weight: bold;    margin: .2em 1em 0 0;"> Rate This PWA</p>
			<div class="userRating2">
				<i id="sstar-1" class="material-icons">star_rate</i>
				<i id="sstar-2" class="material-icons">star_rate</i>
				<i id="sstar-3" class="material-icons">star_rate</i>
				<i id="sstar-4" class="material-icons">star_rate</i>
				<i id="sstar-5" class="material-icons">star_rate</i>
			</div>
		</div>	
		
		<p style="font-weight: bold;    margin: .2em 1em 0 0;"> Your Review</p>
		<textarea id="userRatingMessage" style="height:100px"></textarea>
		<button class="btn orange postRatingBtn">Post Rating</button>
	</div>
</div>

<script type="text/javascript">
	let userRating = 0;
	
	$(".userRating i").on("mouseover", e=>{		
		$(".userRating i").css("color", "grey");
		
		for(let i=1; i<=$(e.target).attr("id").split("-")[1]; i++){
			$("#star-"+i).css("color", "#ffc61a");
		}
	});
	
	$(".userRating").on("mouseleave", e=>{
		
		$(".userRating i").css("color", "grey");		
	});
	
	$(".userRating").click(_=>{
		$(".ratingPopOuterContainer").show();
	});
	
	$(".userRating2 i").on("mouseover", e=>{
		
		$(".userRating2 i").css("color", "grey");
		
		for(let i=1; i<=$(e.target).attr("id").split("-")[1]; i++){
			$("#sstar-"+i).css("color", "#ffc61a");
		}
	});
	
	$(".userRating2").on("mouseleave", e=>{
		if(userRating==0)
			$(".userRating2 i").css("color", "grey");		
	});
	
	$(".userRating2 i").click(e=>{
		userRating = $(e.target).attr("id").split("-")[1];
	});
	
	$(".postRatingBtn").click(e=>{
		$.post("/PWAs/addReview",{
			pwaId:'<%= pwa.getPwaId() %>',
			message: $("#userRatingMessage").val(),
			rating: userRating
		}, _=>{
			$(".ratingPopOuterContainer").hide();
			window.location.reload();
		})
	});
</script>

<style>
	.userRating i{
		color: grey;
		cursor: pointer;
	}

	.reviewContainer{
		display: flex;
		height: 150px;
		width: 600px;
		margin: 1em 0;
	}
	
	.reviewUserPicContainer{
		fle: 1;
		padding: .5em 0 0 .5em;
		margin: 0 2.5em 0 0;
	}
	
	.reviewUserPicContainer img{
		width: 100%;		
		border-radius: 5em;
		object-fit: cover;
	}
	
	.reviewContent{
		fle: 5;
		display: flex;
		flex-direction: column;
	}
	
	.reviewUserName{
		font-weight: bold;
		font-size: 18px;
	}
	
	.reviewRating i{
		font-size: 16px;
		color: grey;
	}
	
	.reviewMessage{
		color: grey;
		font-size: 14px;
		text-align: justify;
	}
	
	.ratingPopOuterContainer{
		position: absolute;
		top:0;
		left:0;
		
		width: 100%;
		height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
		
		background-color: rgb(0, 0, 0, .4);
	}
	
	.ratingCard{
		background-color: white;
		border-radius: .3em;
		padding:0em 1em 1em 1em;
		display: flex;
		flex-direction: column;
		
		width:350px;
	    height: 370px;
	    box-shadow: 20px 20px 30px rgb(0, 0, 0, 0.3);
	}
	
	.userRating2 i{
		color: grey;
		cursor: pointer;
	}
	
	.postRatingBtn{
		margin: 2em 0 0 0;
	}
	
</style>