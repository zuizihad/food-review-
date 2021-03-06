<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Package.ConnectionClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Restaurant
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
   <link href="com.css/material-dashboard.css" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
                    <%
            Connection conn;
            Statement st;
            ResultSet rs;
            PreparedStatement pst;
            ConnectionClass obj1= new ConnectionClass();
            conn= obj1.getConnectiontoSQLite();
            
            %>
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="img/img_2.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
        <a href="" class="simple-text logo-normal">
          food bank
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item  ">
            <a class="nav-link" href="./dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Top Rated</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="user.jsp">
              <i class="material-icons">person</i>
              <p>User Profile</p>
            </a>
          </li>
          <li class="nav-item active ">
            <a class="nav-link" href="restaurantList.jsp">
              <i class="material-icons">content_paste</i>
              <p>Restaurant List</p>
            </a>
          </li>
                    <li class="nav-item ">
            <a class="nav-link" href="post.jsp">
              <i class="material-icons">post</i>
              <p>Post</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="https://www.google.com/maps/">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="">
              <i class="material-icons">notifications</i>
              <p>Notifications</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">Restaurant List</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="dashboard.jsp">
                  <i class="material-icons">dashboard</i>
                  <p class="d-lg-none d-md-block">
                    Stats
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">5</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Mike John responded to your email</a>
                  <a class="dropdown-item" href="#">You have 5 new tasks</a>
                  <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                  <a class="dropdown-item" href="#">Another Notification</a>
                  <a class="dropdown-item" href="#">Another One</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="user.jsp">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Dhaka</h4>
                  <p class="card-category"> All  Restaurant in Dhaka area</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          City
                        </th>
                        <th>
                          Area
                        </th>
                        <th>
                          Restaurant Name
                        </th>
                       
                        <th>
                          Rating
                        </th>
                      </thead>
                      <tbody>
                        <p class="card-text">
        
            <%
        try{
        String sql= "SELECT * FROM reviewTable where city like 'dhaka'";
        st=conn.createStatement();
        rs=st.executeQuery(sql);
        while(rs.next()){
            
        
        %>
        <tr style="font-family: inherit ; color: #468847" >
            <td><%=rs.getString("city") %> <br /></td>
            <td><%=rs.getString("area") %><br /> </td>
            <td><%=rs.getString("restaurantName") %> <br /></td>
           
            <td><%=rs.getString("rating") %> <br /></td>
        </tr>
        <%
            }
        }catch (Exception e){
                    out.print(e.toString());
                }
            
            %>
        
    </p>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
            
        <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Chittagong</h4>
                  <p class="card-category"> All  Restaurant in Chittagong area</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          City
                        </th>
                        <th>
                          Area
                        </th>
                        <th>
                          Restaurant Name
                        </th>
                       
                        <th>
                          Rating
                        </th>
                      </thead>
                      <tbody>
                        <p class="card-text">
        
            <%
        try{
        String sql= "SELECT * FROM reviewTable where city like 'chittagong' ";
        st=conn.createStatement();
        rs=st.executeQuery(sql);
        while(rs.next()){
            
        
        %>
        <tr style="font-family: inherit ; color: #468847" >
            <td><%=rs.getString("city") %> <br /></td>
            <td><%=rs.getString("area") %><br /> </td>
            <td><%=rs.getString("restaurantName") %> <br /></td>
           
            <td><%=rs.getString("rating") %> <br /></td>
        </tr>
        <%
            }
        }catch (Exception e){
                    out.print(e.toString());
                }
            
            %>
        
    </p>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
            
        <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Other City</h4>
                  <p class="card-category"> All  Restaurant  </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          City
                        </th>
                        <th>
                          Area
                        </th>
                        <th>
                          Restaurant Name
                        </th>
                       
                        <th>
                          Rating
                        </th>
                      </thead>
                      <tbody>
                        <p class="card-text">
        
            <%
        try{
        String sql= "SELECT * FROM reviewTable where city not like 'chittagong' and city not like 'dhaka' ";
        st=conn.createStatement();
        rs=st.executeQuery(sql);
        while(rs.next()){
        %>
        <tr style="font-family: inherit ; color: #468847" >
            <td><%=rs.getString("city") %> <br /></td>
            <td><%=rs.getString("area") %><br /> </td>
            <td><%=rs.getString("restaurantName") %> <br /></td>
           
            <td><%=rs.getString("rating") %> <br /></td>
        </tr>
        <%
            }
        }catch (Exception e){
                    out.print(e.toString());
                }
            
            %>
        
    </p>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
            
      <footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <li>
                <a href="https://www.github.com/teamtigers71">
                  GIT HUB
                </a>
              </li>
              <li>
                <a href="https://facebook.com/teamtigers71">
                  About Us
                </a>
              </li>
              <li>
                <a href="">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="https://www.facebook.com/teamtigers71" target="_blank">team tigers71</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
</body>

</html>