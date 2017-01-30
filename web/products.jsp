<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="images/home/logo1.jpg"/>
    <title><%=request.getParameter("captain")%>-<%=request.getParameter("subcaptain")%> | StuDeals</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <%@include file="connect.jsp"%>
        <%  String branch=request.getParameter("captain");
            String subcategory=request.getParameter("subcaptain");
            int i=1,n=0,m=4;
            String sql="select count(*) as 'Count' from products where productQuantity>0 and productBranch='"+branch+"' and productSubCategory='"+subcategory+"' ";
            String sql1="select * from products where productQuantity>0 and productBranch='"+branch+"' and productSubCategory='"+subcategory+"' and productQuantity>0 ";
            rs=st.executeQuery(sql);
            rs.first();
            n=Integer.parseInt(rs.getString("Count"));
            Random rd=new Random();
            rs1=st.executeQuery(sql1);
    %>
        
    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <jsp:include page="Home/header_top.jsp"/>   
        </div><!--/header_top-->

        <div class="header-middle"><!--header-middle-->
            <jsp:include page="Home/header_middle.jsp" />
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <jsp:include page="Home/header_bottom.jsp"/>
        </div><!--/header-bottom-->
    </header><!--/header-->

    <section>
        <div class="container">
                <div class="container">
                    <div class="breadcrumbs">
                        <ol class="breadcrumb">
                          <li><a href="index.jsp">Home</a></li>
                          <li class="active"><%=request.getParameter("captain")%>-<%=request.getParameter("subcaptain")%>&#9658;</li>
                        </ol>
                    </div><!--/breadcrumbs-->
                </div>
		<div class="features_items"><!--features_items-->
                    <%  if(n==0){ %>
                    <div class="col-sm-12">
                        <h2 class="remember text-center" style="margin-bottom: 100px" >Sorry!! Product Not Found.</h2>
                    </div>
                    <%  }else{
                            
                            m=rd.nextInt(n);
                    %>
                    <hr style="margin-bottom: 70px">
                    <%
                        while(rs1.next()){
                    %> 
                    <div class="col-sm-3">
                        <div class="product-image-wrapper">
                            <div>
                                <div class="productinfo text-center">
                                    <a href="product-details.jsp?captain=<%=rs1.getString("productBranch")%>&subcaptain=<%=rs1.getString("productSubCategory")%>&productID=<%=rs1.getString("productID")%>">
                                        <img class="img-thumbnail img-rounded" src="<%=rs1.getString("productImage") %>" alt="" />
                                    </a>
                                    <h2>Rs.<%=rs1.getString("productPrice") %></h2>
                                    <p><strong><%=rs1.getString("productName") %></strong></p>
                                    <a href="addtocart.jsp?pid=<%=rs1.getString("productID")%>&quantity=1" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>
                            </div>
                            <%  m=rd.nextInt(n);
                                if(i==m){ 
                            %>
                            <img src="images/home/new.png" class="new" alt="" />
                            <% } %>
                            <div class="choose">
                                <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <% 
                       i++;
                    }} %>
                </div><!--features_items-->
            </div>
        </div>
    </section>
    
    <footer id="footer"><!--Footer-->
        <jsp:include page="Home/footer.jsp"/>
    </footer><!--/Footer-->
</body>
</html>