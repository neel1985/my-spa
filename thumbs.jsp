<%@ include file="/jsps/imports.jsp"%>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/sliderstyle.css" />

<script src="<%= request.getContextPath()%>/js/modernizr.custom.slider.js"></script>
<script src="<%= request.getContextPath()%>/js/jquery.catslider.js"></script>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects/>
<%
	String projectId = "";
	PortalUtility objPortalUtility = new PortalUtility(session,request);
	PortalBean objPortalBean = objPortalUtility.getObjPortalBean();
	projectId = objPortalBean.getProjectId();
%>
<%-- <form method="POST" action="<portlet:actionURL />"> --%>	
<div class="conTainer">
<%-- <% 
	Object resP = request.getAttribute("status");
    /* String result = resP.toString(); */
	if (resP != null){
%>
	<%@ include file="/jsps/marketplace/selection.jsp"%>		
<% } else { %>	 --%>
	<script type="text/javascript">
		//var username = $('#uname').val();
		//var userrole = $('#urole').val();
		//var userproj = '115';
		var userproj = '<%= projectId %>';
		var ajaxurL = "<portlet:resourceURL escapeXml='false'/>&userproj="+userproj;
		$(document).ready(function(){
			$.ajax({
				  dataType: "json",
				  url: ajaxurL,
				  method: 'GET',
				  async: true,
				  cache: false,
				  data: {
					  userproj : userproj,
					  operation : 'MARKET_PLACE_FETCH_DATA',
				  },
				  success: function(data){									//replace error with success when it is fetching real time json
					 // var daTa = [{"RAM_Size":2,"Category":"Small","Project_Type":"GL","OS":"windows","Additional_Storage":115,"vCPU":1,"Service_Offeringid":1,"HDD_Size":50, "Cost" : "$1.3"}];
				  	  var len = Object.keys(data[0]).length;   				//will return the number of data inside jsonobject
					  console.log(data.length+":::length of DTO:::::"+len);
					  for(var i=0; i<data.length; i++){                     // data.length will return number of json objects
						 console.log(data[i].RAM_Size);
						 var liEl = document.createElement("li");          //creating <li/> element
						 liEl.setAttribute("id", "prdLi");
						 var div1El = document.createElement("div");       //creating <div/> element
						 div1El.className="caption header";                //giving it a classname
						 div1El.innerHTML = "Windows Server";
						 var div2El = document.createElement("div");
						 div2El.className="caption thumbnail";					 		   
						 
						 // p elements inside thumbnail div
						 var p1El = document.createElement("p");
						 p1El.className="size";
						 var b1El = document.createElement("b");
						 var t1 = document.createTextNode(data[i].Category);      		// Creating a text node
						 b1El.appendChild(t1);                                          //appending textnode to b element
						 p1El.appendChild(b1El);
						 
						 var p2El = document.createElement("p");
						 p2El.className="cost";
						 var b2El = document.createElement("b");
						 var t2 = document.createTextNode(data[i].Cost);        // Creating a text node
						 b2El.appendChild(t2);                                  //appending textnode to b element
						 p2El.appendChild(b2El);
						 //---- end --------//
						 
						 var div3El = document.createElement("div");
						 div3El.className="row";
						 
						 var div4El = document.createElement("div");
						 div4El.className="col-sm-5";
						 div4El.innerHTML = "OS: ";
						 
						 var div5El = document.createElement("div");
						 div5El.className="col-sm-7";
						 div5El.innerHTML = data[i].OS;
						 
						 div3El.appendChild(div4El);
					     div3El.appendChild(div5El);                   <!-- 1 -->
					     
					     var div6El = document.createElement("div");
						 div6El.className="row";
						 
						 var div7El = document.createElement("div");
						 div7El.className="col-sm-5";
						 div7El.innerHTML = "vCPU: ";
						 
						 var div8El = document.createElement("div");
						 div8El.className="col-sm-5";
						 div8El.innerHTML = data[i].vCPU;
						 
						 div6El.appendChild(div7El);
					     div6El.appendChild(div8El);
					     												<!-- 2 -->
					     var div9El = document.createElement("div");
						 div9El.className="row";
						 
						 var div10El = document.createElement("div");
						 div10El.className="col-sm-5";
						 div10El.innerHTML = "RAM: ";
						 
						 var div11El = document.createElement("div");
						 div11El.className="col-sm-5";
						 div11El.innerHTML = data[i].RAM_Size;
						 
						 div9El.appendChild(div10El);
					     div9El.appendChild(div11El);
					     												<!-- 3 -->
					    var div12El = document.createElement("div");
						 div12El.className="row";
						 
						 var div13El = document.createElement("div");
						 div13El.className="col-sm-5";
						 div13El.innerHTML = "HDD: ";
						 
						 var div14El = document.createElement("div");
						 div14El.className="col-sm-5";
						 div14El.innerHTML = data[i].HDD_Size;
						 
						 var hdivEl1 = document.createElement("div");
						 hdivEl1.innerHTML = data[i].Serial_Order; //setAttribute("value", data[i].Serial_Order);
						 hdivEl1.style.visibility='hidden';

						 var hdivEl2 = document.createElement("div");
						 hdivEl2.innerHTML = data[i].Project_Type;  //setAttribute("value", data[i].Project_Type);
						 hdivEl2.style.visibility='hidden';
						 
						 var hdivEl3 = document.createElement("div");
						 hdivEl3.innerHTML = data[i].Additional_Storage;
						 hdivEl3.style.visibility='hidden';
						 
						 var hdivEl4 = document.createElement("div");
						 hdivEl4.innerHTML = data[i].reconciliation_id;
						 hdivEl4.style.visibility='hidden';
						 
						 var hdivEl5 = document.createElement("div");
						 hdivEl5.innerHTML = data[i].gu_Id;
						 hdivEl5.style.visibility='hidden';
						 
						 var hdivEl6 = document.createElement("div");
						 hdivEl6.innerHTML = data[i].contract_line_Id;
						 hdivEl6.style.visibility='hidden';
						 
						 var hdivEl7 = document.createElement("div");
						 hdivEl7.innerHTML = data[i].cloud_class;
						 hdivEl7.style.visibility='hidden';				 
						 
					     	 div12El.appendChild(div13El);
					     	 div12El.appendChild(div14El);
					     												<!-- 4 -->
					     	 div2El.appendChild(p1El);
					     	 div2El.appendChild(p2El);
					     	 div2El.appendChild(div3El);
					     	 div2El.appendChild(div6El);
					     	 div2El.appendChild(div9El);
					     	 div2El.appendChild(div12El);
					     	 div2El.appendChild(hdivEl1);
					     	 div2El.appendChild(hdivEl2);
					     	 div2El.appendChild(hdivEl3);
					     	 div2El.appendChild(hdivEl4);
					     	 div2El.appendChild(hdivEl5);
					     	 div2El.appendChild(hdivEl6);
					     	 div2El.appendChild(hdivEl7);
						 liEl.appendChild(div1El);
						 liEl.appendChild(div2El);						 
						 var popULel = document.getElementById('popprd');
						 popULel.appendChild(liEl);
					 }
				  }
			 });
		});
	</script>
			<div class="main">
				<div id="mi-slider" class="mi-slider">
					<ul id="popprd">
						<!-- <li>
							<div class="caption header">Casual</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
							</div>
						</li>
						<li>
							<div class="caption header">Luxury</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Sport</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li> -->
					</ul>
					<!-- <ul class="stdprd">
						<li>
							<div class="caption header">CentOS</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
								<a class="btn btn-mini" href="#">» Read More</a>
							</div>
						</li>
						<li>
							<div class="caption header">Ubuntu</div>
							<div class="caption thumbnail">
									<p class="left size"><b>Medium</b></p>
								<h4 class="cost"><b>$1.2/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Windows Server 2012R2</div>
							<div class="caption thumbnail">
									<p class="left size"><b>Large</b></p>
								<h4 class="cost"><b>$3.2/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Linux</div>
							<div class="caption thumbnail">
									<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
					</ul>
					<ul class="featprd">
						<li>
							<div class="caption header">Linux</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Linux2</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Linux3</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
						<li>
							<div class="caption header">Linux4</div>
							<div class="caption thumbnail">
								<p class="left size"><b>Small</b></p>
								<h4 class="cost"><b>$0.9/hour</b></h4>
								<div class="row">
									<div class="col-sm-5">OS :</div>
									<div class="col-sm-7">CentOS 5.5</div>
								</div>
								<div class="row">
									<div class="col-sm-5">vCPU :</div>
									<div class="col-sm-5">1</div>
								</div>
								<div class="row">
									<div class="col-sm-5">RAM :</div>
									<div class="col-sm-5">2 GB</div>
								</div>
								<div class="row">
									<div class="col-sm-5">HDD :</div>
									<div class="col-sm-5">50 GB</div>
								</div>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
						</li>
					</ul> -->
					<nav>
						<a href="#">Popular Products</a>
						<!-- <a href="#">Standard Products</a>
						<a href="#">Featured Products</a> -->
					</nav>
				<div>
					<img id="prevArrow" src="<%= request.getContextPath()%>/img/Carousel/previous.png"></img>
					<img id="nextArrow" src= "<%= request.getContextPath()%>/img/Carousel/next.png"></img>
				</div>
				</div>
			</div>
		  <%-- <% } %> --%>
		</div><!-- /container -->
	 <!-- </form> -->
		<script type="text/javascript">
		    var texts = [];
			var vmType = "";
			var vmcosT = "";
			var oS = "";
			var cPus = "";
			var mEm = "";
			var stoRage = "";
			var recon_id = "";
			var guid = "";
			var contract_line_Id = "";
			var cl_cls = "";
		    
			$(function() {
				var i=0;
				$('#mi-slider').catslider();
				$("#nextArrow").on('click', function(){
					fwdloop();
				});
				$("#prevArrow").on('click', function(){
					bkwdloop();
				});
				
				function bkwdloop() {
				    var obj = $('#mi-slider').find('.mi-current').children();
					if (i<obj.length){
						obj[i].style.display = 'inline-block';
					}
					i--;
					console.log(i);
					if(i < 0){
						i++;
					}
				}
				function fwdloop() {
					var obj = $('#mi-slider').find('.mi-current').children();
					if (i<obj.length){
						obj[i].style.display = 'none';
					}
					i++;
					console.log(i);
					if(i == obj.length){
						i--;
					}
				}
			
			$('#popprd').delegate("#prdLi", "click", function() {
					var obj = $(this).find(".thumbnail").children();
					obj.each(function(index,element){
    					texts.push($(this).text());
					});
					console.log(texts);
					
				$.ajax({
						url: '/WCSGPortal/jsps/marketplace/selection.jsp?projectId='+userproj, 
						async: true,
					    cache: false,
						success: function(result){
							console.log("success");
							$(".conTainer").html(result);
							for (var i=0; i<texts.length; i++){
								vmType = texts[0];
								vmcosT = texts[1];
								oS = texts[2];
								cPus = texts[3];
								mEm = texts[4];
								stoRage = texts[5];
								sOrder = texts[6];
								prType = texts[7];
								adStr = texts[8];
								recon_id = texts[9];
								guid = texts[10];
								contract_line_Id = texts[11];
								cl_cls = texts[12];
							}
							console.log(vmType + "/" + vmcosT + "/" + oS + "/" + cPus + "/" + mEm + "/" + stoRage+ "/" + sOrder + "/" + prType + "/" + adStr + 
									"/" + recon_id + "/" + guid + "/" + contract_line_Id + "/" + cl_cls);
							var split_oS = oS.split(":");
							var split_cPus = cPus.split(":");
							var split_mEm = mEm.split(":");
							var split_stoRage = stoRage.split(":");
							$('#size').html('<b>'+vmType+'</b>');
							$('#vCPUS').val(split_cPus[1]);
							$('#vmCost').text(vmcosT);
							$("<option />", {value: split_mEm[1], text: split_mEm[1]}).appendTo('#RAM');
							$("<option />", {value: split_stoRage[1], text: split_stoRage[1]}).appendTo('#Storage');
							$("<option />", {value: adStr, text: adStr}).appendTo('#AdditionalStorage');
							$("<option />", {value: split_oS[1], text: split_oS[1]}).appendTo('#OS');
							$('#ser_ord').val(sOrder);
							$('#pr_type').val(prType);
							$('#cloudClass').val(cl_cls);
							$('#reconciliationId').val(recon_id);
							$('#guId').val(guid);
							$('#contractLineID').val(contract_line_Id);

						} 
					});
				  /* } */
				});
			});
		</script>
		
		<style type="text/css">
			.thumbnail {
				background-color: #eee !important;
			}
			.header{
				background-color: #1c72aa;
				color:white;
			}
			.size{
				font-size: 1.1em;
			}
			.cost{
				color: red;
			}
			.btn-mini {
				color: #cd7700 !important;
			}
			.btn-mini:hover {
				color: black !important;
			}
			#prevArrow{
				margin-top: 5%;
				margin-left: -2%;
			}
			
			#nextArrow{
				margin-top: -5%;
				margin-left: 99%;
			}
		</style>